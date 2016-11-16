import random
import time


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