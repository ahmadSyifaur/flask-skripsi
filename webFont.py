from selenium import webdriver
from selenium.webdriver import chrome
# from webdriver_manager.chrome import ChromeDriverManager
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument('--headless')
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--disable-dev-shm-usage')
chrome_options.add_argument('user-agent=Mozilla/5.0 (Windows Phone 10.0; Android 4.2.1; Microsoft; Lumia 640 XL LTE) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Mobile Safari/537.36 Edge/12.10166')


# driver = webdriver.Chrome(ChromeDriverManager().install())

def getWebFont(url):
  wd = webdriver.Chrome('chromedriver',chrome_options=chrome_options)
  # wd = webdriver.Chrome(ChromeDriverManager().install())
  all_font = []
  try:
    wd.get(url)
    # wd.implicitly_wait(10)
    all_source = wd.find_elements_by_xpath("//span")
    # alla = wd.find_elements_by_xpath("//span")
    for ii in all_source:
      # one_class = ii.get_property("font-family")
      # print(ii)
      tmp = ii.value_of_css_property("font-family")
      split_font_family = tmp.split(", ")
      font_tmp=[s.strip('"/') for s in split_font_family]
      font_tmp=[s.replace('-', ' ') for s in font_tmp]
      # print([s.replace('8', '') for s in lst]) # remove all the 8s
      loop=0
      for i in font_tmp:
        all_font.append(font_tmp[loop]) 
        loop+=1
  except:
      pass

  all_font = list(dict.fromkeys(all_font))
  return all_font

