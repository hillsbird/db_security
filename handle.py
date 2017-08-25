# -*- encoding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import json
import requests
import string
import re
import datetime
import time


# json
# {
#     "logid": 2072,
#     "dbname": "laifenqi",
#     "username": "zhangyanjun",
#     "sqlstr": "select * from news where type =5 order by created_at desc limit 1000 ",
#     "costtime": 1492,
#     "rowcount": 1000,
#     "errmess": "",
#     "_timestamp": "2017-08-21 14:57:25"
# }


def get_messages(dbid, sqlstring_c, checkname, btime, etime):
    s = "http://dba.qudian.online/face.html?action=sqllog&dbid=" + dbid + "&sqlstring_c=" + sqlstring_c + "&checkname=" + checkname + "&btime=" + btime + "&etime=" + etime + "&returntype=json&token=XHBITX0VE8RF3Y4PR6#"
    r = requests.get(s)
    m = r.text.replace('},{', '}},{{').split('},{')
    return m


def handle_message(message):
    print message
    message = message.replace('logid:', '"logid":') \
        .replace('dbname:', '"dbname":') \
        .replace('username:', '"username":') \
        .replace('sqlstr:', '"sqlstr":') \
        .replace('costtime:', '"costtime":') \
        .replace('rowcount:', '"rowcount":') \
        .replace('errmess:', '"errmess":') \
        .replace('_timestamp:', '"_timestamp":') \
        .replace('\'', '\"') \
        .replace("、", "") \
        .replace("‘", "") \
        .replace('“', '') \
        .replace("《", "<") \
        .replace("》", ">") \
        .replace("`", "'")
    message = json.loads(message)
    return message


def get_sqlstring(message):
    return message['sqlstr']


def get_user(message):
    return message['username']


def get_db(message):
    return message['dbname']


def get_costtime(message):
    return message['costtime']


def get_lines(message):
    return message['rowcount']


def get_err_message(message):
    return message['errmess']


def get_time(message):
    return message['_timestamp']


def audit_user_and_priv_change_sql(user, db, sqlstring, costtime, time, errmess, lines):
    code = 0
    f = open('/home/weichongfeng/db_security/rules/user_priv.rules', 'r')
    rules = f.readlines()
    for i in rules:
        if i.startswith('#') or i == '':
            pass
        else:
            p = re.compile(str(i), re.IGNORECASE)
            m = p.match(sqlstring)
            if m:
                print 'match ' + str(count) + ' : ' + i
                print 'find a user priv change dangerous sql: ' + sqlstring
                print 'user: ' + user
                print 'db: ' + db
                print 'time: ' + time
                print 'costtime: ' + costtime
                print 'lines: ' + lines
                print '*' * 100
                sms('find a user priv change dangerous sql:' + sqlstring + ' | ' + user + ' | ' + db + ' | ' + time + '| ' + costtime + ' | ' + lines)
                code = 1
                break
    f.close()
    return code


def audit_sqlinjection(user, db, sqlstring, costtime, time, errmess, lines):
    code = 0
    f = open('/home/weichongfeng/db_security/rules/sqlinjection.rules', 'r')
    rules = f.readlines()
    count = 0
    for i in rules:
        count = count + 1
        i = i.strip()
        if i.startswith('#') or i == '':
            pass
        else:
            p = re.compile(str(i), re.IGNORECASE)
            m = p.match(sqlstring)
            if m:
                print 'match ' + str(count) + ' : ' + i
                print 'find a sql injection dangerous sql: ' + sqlstring
                print 'user: ' + user
                print 'db: ' + db
                print 'time: ' + time
                print 'costtime: ' + costtime
                print 'lines: ' + lines
                print '*' * 100
                sms('find a sql injection dangerous sql:' + sqlstring + ' | ' + user + ' | ' + db + ' | ' + time + ' | ' + costtime + ' | ' + lines)
                code = 1
                break
    f.close()
    return code


# def audit_sensitive_db(user,db,sqlstring,costtime,time,errmess,lines):
#    code = 0
#    f = open('/Users/weichongfeng/Desktop/project/db_security/rules/sensitive_db.rules', 'r')
#    rules = f.readlines()
#    for i in rules:
#        if i.startswith('#') or i == '':
#            pass
#        else:
#            p = re.compile(i)
#            m = p.match(sqlstring)
#            if m:
#                print 'match ' + str(count) + ' : ' + i
#                print 'find a sensitive db access dangerous sql: ' + sqlstring
#                print 'user: '+user
#                print 'db: '+db
#                print 'time: '+time
#                print 'costtime: '+costtime
#                print 'lines: '+lines
#                print '*' * 100
#                code = 1
#                break
#    f.close()
#    return code


def audit_max_once(user, db, sqlstring, costtime, time, errmess, lines):
    code = 0
    if lines != 'Null' and int(lines) >= 10000:
        code = 1
        print 'current sql get too many lines: ' + sqlstring
        print 'user: ' + user
        print 'db: ' + db
        print 'time: ' + time
        print 'costtime: ' + costtime
        print 'lines: ' + lines
        print '*' * 100
        sms('current sql get too many lines:' + sqlstring + ' | ' + user + ' | ' + db + ' | ' + time + ' | ' + costtime + ' | ' + lines)
    return code


def audit_max_onehour(u_l6=[]):
    code = 0
    u_c = dict()
    for i in u_l6:
        u_c[i.split(':')[0]] = 0
    for i in u_l6:
        u_c[i.split(':')[0]] = int(u_c[i.split(':')[0]]) + int(0 if (i.split(':')[1] == 'Null') else i.split(':')[1])
    for k in u_c:
        if u_c[k] >= 50000:
            code = 1
            print 'current one hour get too many result'
            print 'user: ' + k
            print 'lines: ' + str(u_c[k])
            print '*' * 100
            sms('current one hour get too many result | ' + k + ' | ' + str(u_c[k]))
    return code


def audit_max_oneday(u_l144=[]):
    code = 0
    u_c = dict()
    for i in u_l144:
        u_c[i.split(':')[0]] = 0
    for i in u_l144:
        u_c[i.split(':')[0]] = int(u_c[i.split(':')[0]]) + int(0 if (i.split(':')[1] == 'Null') else i.split(':')[1])
    for k in u_c:
        if u_c[k] >= 100000:
            code = 1
            print 'current one day get too many result'
            print 'user: ' + k
            print 'lines: ' + str(u_c[k])
            print '*' * 100
            sms('current one day get too many result | ' + k + ' | ' + str(u_c[k]))
    return code


def sms(content):
    print 'sms'
    url = 'http://10.157.92.228:8001/sms/queue_sms_send'
    param = {'mobile': '18515667715', 'content': content, 'action': '666'}
    r = requests.post(url, param)
    print r.text
    return r.text


if __name__ == '__main__':
    n = 0
    u_l6 = list()
    u_l144 = list()
    while True:
        etime = str(datetime.datetime.now()).split('.')[0].replace(' ', '%20')
        btime = str(datetime.datetime.now() - datetime.timedelta(minutes=10)).split('.')[0].replace(' ', '%20')
        messages = get_messages('0', '', '', btime, etime)
        if messages[0]:
            for message in messages:
                message = handle_message(message)
                sqlstring = get_sqlstring(message).encode('utf-8')
                # sqlstring = "select table_comment from information_schema.tables where table_schema='diwojndiw' and table_name='hfiurefhne'"
                user = get_user(message)
                db = get_db(message)
                costtime = str(get_costtime(message))
                timestamp = get_time(message)
                errmess = get_err_message(message)
                lines = str(get_lines(message))
                u_l6.append(user + ':' + lines)
                u_l144.append(user + ':' + lines)
                audit_sqlinjection(user, db, sqlstring, costtime, timestamp, errmess, lines)
                # audit_sensitive_db(user, db, sqlstring, costtime, timestamp, errmess, lines)
                audit_user_and_priv_change_sql(user, db, sqlstring, costtime, timestamp, errmess, lines)
                audit_max_once(user, db, sqlstring, costtime, timestamp, errmess, lines)
        time.sleep(600)
        n = n + 1
        if n % 6 == 0 and u_l6:
            audit_max_onehour(u_l6)
            u_l6[:] = []
        if n % 144 == 0 and u_l144:
            audit_max_oneday(u_l144)
            u_l144[:] = []
