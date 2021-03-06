#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__author__ = "zhangyouliang"

from apscheduler.schedulers.blocking import BlockingScheduler
import datetime
import time
import logging,os
from app.jobs.rank import *
from app.jobs.sort import *
from app.jobs.hot import *
from app.jobs.info import *
from app.jobs.launder import Launder

sched = BlockingScheduler()

# @sched.scheduled_job('interval',seconds=3)
# def timed_job():
    # print("This job is run every three minutes.")

'''
year (int|str) – 4-digit year
month (int|str) – month (1-12)
day (int|str) – day of the (1-31)
week (int|str) – ISO week (1-53)
day_of_week (int|str) – number or name of weekday (0-6 or mon,tue,wed,thu,fri,sat,sun)
hour (int|str) – hour (0-23)
minute (int|str) – minute (0-59)
second (int|str) – second (0-59)

start_date (datetime|str) – earliest possible date/time to trigger on (inclusive)
end_date (datetime|str) – latest possible date/time to trigger on (inclusive)
timezone (datetime.tzinfo|str) – time zone to use for the date/time calculations (defaults to scheduler timezone)

*    any    Fire on every value
*/a    any    Fire every a values, starting from the minimum
a-b    any    Fire on any value within the a-b range (a must be smaller than b)
a-b/c    any    Fire every c values within the a-b range
xth y    day    Fire on the x -th occurrence of weekday y within the month
last x    day    Fire on the last occurrence of weekday x within the month
last    day    Fire on the last day within the month
x,y,z    any    Fire on any matching expression; can combine any number of any of the above expressions
'''
# @sched.scheduled_job('cron',  hour='1', minute='0')
# def schedule_jon():
#     print('This job is run every weekday at 1pm.')
#     jfq = Jfq()
#     jfq.exec_appid_bundleid()
@sched.scheduled_job('cron',  hour='1', minute='00')
def schedule_jon():
    l = Launder()
    l.start()

@sched.scheduled_job('cron',  hour='1', minute='30')
def schedule_jon():
    info = AppInfo()
    info.optimizeAppInfo()

@sched.scheduled_job('cron',  hour='1', minute='30')
def schedule_jon():
    sort = Sort()
    sort.getAppSort()

@sched.scheduled_job('cron',  hour='1', minute='30')
def schedule_jon():
    hot = Hot()
    hot.getHotByKeyWord()
@sched.scheduled_job('cron',  hour='09', minute='00')
def schedule_jon():
    rank = Rank()
    rank.getRankAfter()


if __name__ =='__main__':
    sched.start()
