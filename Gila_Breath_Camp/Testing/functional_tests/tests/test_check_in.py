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
			sel_all_number = lod[i]['sel_all_number']
			sleep = lod[i]['sleep']
			try:
				self.test_check_in(sel_all_number,int(sleep))
				cf.insertIntoCsv(['Test Check In', csvName,i,'Success'])
			except Exception as e:
				cf.insertIntoCsv(['Test Check In', csvName,i,'Error'])
		#print(out_lol)
	
	def test_main_check_in(self):
		self.test_readFromCsAndRUnTestCheckIn("input.csv")
	
	def test_registration_form_redirection(self):
		print (self.driver.title)
		self.home_page.click_on_clerk_button()
		#import pdb;pdb.set_trace()
		#clerk_btn = driver.find_element_by_xpath("//a[@href='/Static/Templates/tran-his.html']")
		#webdriver.ActionChains(driver).move_to_element(clerk_btn).click(clerk_btn).perform()
	
	def test_check_in(self,sel_all_number,sleep):
		self.home_page.click_checkin()
		time.sleep(sleep)
		self.home_page.click_sel_all(sel_all_number)
		time.sleep(sleep)
		self.home_page.click_sub_checkin()
		time.sleep(sleep)
		self.home_page.click_browser_ok()
		time.sleep(sleep)
