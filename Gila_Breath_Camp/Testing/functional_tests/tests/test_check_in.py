from selenium import webdriver
import pytest
import time
from .base_test import BaseTest
from ..pages.home_page import HomePage
import Common_test_functions

class TestRegistrationPage(BaseTest):

	def setup_method(self):
		self.home_page = HomePage(self.driver)
		self.home_page.visit()

	def terardown_method(self):
		self.driver.close()

	def readFromCsAndRUnTestCheckIn(self,csvName):
		cf = Common_test_functions.Common_test_functions()
		lod = cf.getFromCsv(csvName)
		out_lol = [['Test Name','Csv Name','Row Number','Status']]
		for i in range(0,len(lod)):
			sel_all_number = lol['sel_all_number']
			try:
				self.test_check_in(test_check_in)
				out_lol.append(['Test Check In', csvName,i,'Success'])
			catch:
				out_lol.append(['Test Check In', csvName,i,'Error'])
		return out_lol
		
	def test_registration_form_redirection(self):
		print (self.driver.title)
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		#clerk_btn = driver.find_element_by_xpath("//a[@href='/Static/Templates/tran-his.html']")
		#webdriver.ActionChains(driver).move_to_element(clerk_btn).click(clerk_btn).perform()
	
	def test_check_in(self,sel_all_number):
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		time.sleep(1)
		self.home_page.click_date_2()
		time.sleep(3)
		self.home_page.click_checkin()
		time.sleep(3)
		self.home_page.click_sel_all(sel_all_number)
		time.sleep(3)
		self.home_page.click_sub_checkin()
		time.sleep(2)
		
