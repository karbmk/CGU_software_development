from selenium import webdriver
import pytest
import time
from .base_test import BaseTest
from ..pages.home_page import HomePage
from .Common_test_functions import Common_test_functions


class TestRegistrationPage(BaseTest):

	def setup_method(self):
		self.home_page = HomePage(self.driver)
		self.home_page.visit()

	def terardown_method(self):
		self.driver.close()

	
	def test_registration_form_redirection(self):
		print (self.driver.title)
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		#clerk_btn = driver.find_element_by_xpath("//a[@href='/Static/Templates/tran-his.html']")
		#webdriver.ActionChains(driver).move_to_element(clerk_btn).click(clerk_btn).perform()

	def test_main_reg_up(self):
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		time.sleep(1)
		self.home_page.click_date_2()
		time.sleep(3)
		self.home_page.select_update_reg()
		time.sleep(3)
		self.home_page.select_appl_id_up(43)
		time.sleep(2)
		self.home_page.click_up_get()
		time.sleep(2)
		self.home_page.enter_c_age_up("17")
		time.sleep(2)
		self.home_page.click_reg_button_up()
		time.sleep(2)
		self.home_page.click_browser_ok()
		time.sleep(2)
