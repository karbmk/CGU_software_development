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

	def test_readFromCsAndRUnTestCheckIn(self,csvName):
		cf = Common_test_functions()
		lod = cf.getFromCsv(csvName,{})
		#out_lol = [['Test Name','Csv Name','Row Number','Status']]
		print(lod)
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		time.sleep(2)
		self.home_page.click_date_2()
		time.sleep(2)
		for i in range(0,len(lod)):
			id = lod[i]['id']
			name = lod[i]['name']
			sleep = lod[i]['sleep']
			try:
				self.test_update_register(id, name, int(sleep))
				
				cf.insertIntoCsv(['Test Update Register', csvName,i,'Success'])
			except Exception as e:
				cf.insertIntoCsv(['Test Update Register', csvName,i,'Error'])
		#print(out_lol)
	
	def test_main_update_register(self):
		self.test_readFromCsAndRUnTestCheckIn("input_update_register.csv")

	def test_registration_form_redirection(self):
		print (self.driver.title)
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		#clerk_btn = driver.find_element_by_xpath("//a[@href='/Static/Templates/tran-his.html']")
		#webdriver.ActionChains(driver).move_to_element(clerk_btn).click(clerk_btn).perform()

	def test_update_register(self, id, name,sleep):
		self.home_page.select_update_reg()
		time.sleep(sleep)
		self.home_page.select_appl_id_up(id)
		time.sleep(sleep)
		self.home_page.click_up_get()
		time.sleep(sleep)
		self.home_page.enter_c_l_name_up(name)
		time.sleep(sleep)
		self.home_page.click_reg_button_up()
		time.sleep(sleep)
		self.home_page.click_browser_ok()
		time.sleep(sleep)
