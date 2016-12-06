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
		time.sleep(1)
		self.home_page.click_date_2()
		time.sleep(3)
		for i in range(0,len(lod)):
			sel_appl_name = lod[i]['sel_appl_name']
			name = lod[i]['name']
			sel_appl_not_with = lod[i]['sel_appl_not_with']
			name_not = lod[i]['name_not']
			try:
				self.test_priority_set(sel_appl_name,name,sel_appl_not_with,name_not)
				cf.insertIntoCsv(['Test priority', csvName,i,'Success'])
			except Exception as e:
				cf.insertIntoCsv(['Test priority', csvName,i,'Error'])
		#print(out_lol)
	
	def test_main_priority(self):
		self.test_readFromCsAndRUnTestCheckIn("input_priority.csv")
	
	def test_registration_form_redirection(self):
		print (self.driver.title)
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		#clerk_btn = driver.find_element_by_xpath("//a[@href='/Static/Templates/tran-his.html']")
		#webdriver.ActionChains(driver).move_to_element(clerk_btn).click(clerk_btn).perform()

	def test_priority_set(self, sel_appl_name, name, sel_appl_not_with, name_not):
		self.home_page.select_priority()
		time.sleep(5)
		self.home_page.select_appl_with(sel_appl_name, name)
		time.sleep(5)
		#self.home_page.select_appl_id_with()
		#time.sleep(2)
		self.home_page.select_appl_not_with(sel_appl_not_with, name_not)
		time.sleep(5)
		#self.home_page.select_appl_id_without()
		#time.sleep(2)
		self.home_page.click_submit_button()
		time.sleep(5)
	