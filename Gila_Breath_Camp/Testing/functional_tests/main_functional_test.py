import pytest
from selenium import webdriver


class BaseTest():
    @classmethod
    def setup_class(cls):
    	#download following exe from here https://chromedriver.storage.googleapis.com/index.html?path=2.25/
    	chromedriver = "C:\Program Files\chromedriver_win32\chromedriver.exe"
    	cls.driver = webdriver.Chrome(chromedriver)
        # cls.browser.implicitly_wait(5)

    @classmethod
    def teardown_class(cls):
    	cls.driver.close()

