import random
import time

from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

class Page(object):
    def __init__(self, browser):
        self.browser = browser
        self.browser.maximize_window()
        # self.browser.implicitly_wait(15)

    def browser(self):
        return self.browser

    def close(self):
        self.browser.close()

    @staticmethod
    def sleep(seconds):
        time.sleep(seconds)

    def wait_till_element_visible(self, locator, timeout=10):
        """
        Checks for visibility of element in screen
        :param locator: it is touple consist of type of locator and locator
        :param timeout: timeout for visiblity
        :return:
        """
        wait = WebDriverWait(self.browser, timeout, poll_frequency=1)
        element = wait.until(EC.visibility_of_element_located(locator))