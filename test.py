from selenium import webdriver

baseurl = 'http://cl.s6e.xyz/' 
url = 'http://cl.s6e.xyz/thread0806.php?fid=22&search=&page={page}' 

browser = webdriver.Chrome()

for page in range(1, 101):
    browser.get(url.format(page=page))
    table = browser.find_elements_by_class_name('t_one')
    for tr in table[5:]:
        td = tr.find_elements_by_tag_name('td')

        ahref = td[1].find_element_by_tag_name('a')
        title = ahref.text
        minutes = title[title.rfind('[')+1: title.rfind(':')]
        link = ahref.get_attribute('href')

        comment_n = td[3].text
        #if int(comment_n) >= 10:
        #    print('comments={comments}\ttitle={title}\tlink={link}'.format(comments=comment_n, title=title, link=link))

        try:
            if int(minutes) >= 40:
                print('{comments}\t{title}]\n{link}'.format(comments=comment_n, title=title, link=link))
        except Exception:
            print('{comments}\t{title}\n{link}'.format(comments=comment_n, title=title, link=link))

browser.quit()
