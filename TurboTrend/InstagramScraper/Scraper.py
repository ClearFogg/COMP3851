import sys

from selenium import webdriver
import time
from selenium.webdriver.chrome.options import Options
from fake_useragent import UserAgent
from bs4 import BeautifulSoup as soup
import requests
from multiprocessing.pool import ThreadPool
from Account import Account as usrAcc

# Initial user agent
Options = webdriver.ChromeOptions()
Options.add_argument("headless")
Options.add_experimental_option("prefs", {"profile.default_content_settings.cookies": 2})
driver = webdriver.Chrome(options=Options)

accPostNo = 10
hashPostNo = 200
numOfScrolls = 20


def replace_char(text):
    # This method takes in the instagram username in "(@InstagramAccount)" format, and changes it to "InstagramAccount".
    for char in ['(', ')', '@', '"', '”', '@', '“', ',', '!']:
        if char in text:
            text = text.replace(char, "")
    return text


def get_posts(url):
    driver.get(url)

    posts = []

    try:
        for x in range(numOfScrolls):
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

            time.sleep(1)

            links = driver.find_elements_by_xpath("//*[@class='v1Nh3 kIKUG  _bz0w']")

            for link in links:
                link = link.find_element_by_tag_name('a')
                element = link.get_attribute('href')

                if element not in posts:
                    posts.append(element)

                else:
                    pass

        # If the page returns 0 results, there must be an error or failure to connect. Quit the web application.
        if len(posts) == 0:
            driver.quit()

        else:
            return posts

    except:
        driver.quit()
        return posts


def post_info(url, num):

    postInfo = get_posts(url)

    newAccountsURL = []

    for i in range(0, len(postInfo)):  # num
        ua = UserAgent()
        userAgent = ua.random
        Options.add_argument(f'user-agent={userAgent}')

        try:
            accountUrl = requests.get(postInfo[i])
            accountPage = soup(accountUrl.content, "html.parser")
            description = accountPage.find_all("meta", attrs={'property': 'og:description'})
            text = description[0].get('content').split()

            # Finds account name
            found = False
            for index in text:
                for char in index:
                    if char == '@' and found is False:
                        accName = index;
                        found = True
                    elif char == '(' and found is False:
                        accName = index;
                        found = True
                    else:
                        break

            cleanAccName = replace_char(accName)

            accUsername = 'https://www.instagram.com/' + cleanAccName

            if accUsername not in newAccountsURL:
                newAccountsURL.append(accUsername)

            likes = text[0]
            comments = text[2]

        except:
            i += 1

    driver.quit()

    return newAccountsURL


def accountPosts(url, num):
    postInfo = get_posts(url)

    for i in range(0, num):  # len(posts)):
        ua = UserAgent()
        userAgent = ua.random
        Options.add_argument(f'user-agent={userAgent}')

        try:
            accountUrl = requests.get(postInfo[i])
            accountPage = soup(accountUrl.content, "html.parser")
            description = accountPage.find_all("meta", attrs={'property': 'og:description'})
            text = description[0].get('content').split()

            # Finds account name
            for index in text:
                for char in index:
                    if char == '@':
                        accName = index;

            cleanAccName = replace_char(accName)

            likes = text[0]
            comments = text[2]

        except:
            i += 1

    driver.quit()


def account_info(urlList, postNum):
    numOfPosts = postNum

    specificAccInfo = []

    for i in range(0, len(urlList)):
        ua = UserAgent()
        userAgent = ua.random
        Options.add_argument(f'user-agent={userAgent}')

        try:
            accountUrl = requests.get(urlList[i])
            accountPage = soup(accountUrl.content, "html.parser")
            description = accountPage.find_all("meta", attrs={'property': 'og:description'})

            # Account information
            text = description[0].get('content')
            text = text.split()

            accName = urlList[i]
            followers = text[0]
            following = text[2]
            posts = text[4]

            tempHolderAcc = usrAcc(accName, followers, following, posts)
            specificAccInfo.append(tempHolderAcc)


        except:
            i += 1

    return specificAccInfo


def main(tag):
    # for i in range(len(tags)):
    ua = UserAgent()
    userAgent = ua.random
    Options.add_argument(f'user-agent={userAgent}')

    accountsFound = post_info("https://www.instagram.com/explore/tags/" + tag, hashPostNo)
    accountsInfo = account_info(accountsFound, accPostNo)

    return accountsInfo


if __name__ == '__main__':
    if len(sys.argv) > 1:
        searchingForTags = str(sys.argv[1]).split(",")

        pool = ThreadPool()

        asyncResult = []
        for i in range(1, len(searchingForTags)):
            asyncResult.append(pool.apply_async(main, (searchingForTags[i],)))

        bigListOfAccounts = []

        for result in asyncResult:
            tempList = result.get()
            for i in range(len(tempList)):
                bigListOfAccounts.append(tempList[i])

        bigOlStringThatGetsPrintedSoCSharpCanSeeIt = ""
        for account in bigListOfAccounts:
            bigOlStringThatGetsPrintedSoCSharpCanSeeIt += "\\" + account.account + "\\" + account.followers + "\\" + account.following + "\\" + account.posts

        print(bigOlStringThatGetsPrintedSoCSharpCanSeeIt)
    else:
        print("No command arguments found.")
