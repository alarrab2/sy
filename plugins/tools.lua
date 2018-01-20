-- BY @ARRAB_H1
-- BY @DevJason

function moody(msg, matches)
if we_sudo(msg) then
if matches[1] == "تنظيف البوت" then
run_bash("rm -rf ~/.telegram-cli/data/sticker/*")
run_bash("rm -rf ~/.telegram-cli/data/photo/*")
run_bash("rm -rf ~/.telegram-cli/data/animation/*")
run_bash("rm -rf ~/.telegram-cli/data/video/*")
run_bash("rm -rf ~/.telegram-cli/data/audio/*")
run_bash("rm -rf ~/.telegram-cli/data/voice/*")
run_bash("rm -rf ~/.telegram-cli/data/temp/*")
run_bash("rm -rf ~/.telegram-cli/data/thumb/*")
run_bash("rm -rf ~/.telegram-cli/data/document/*")
run_bash("rm -rf ~/.telegram-cli/data/profile_photo/*")
run_bash("rm -rf ~/.telegram-cli/data/encrypted/*")
return "*☢￤تم حذف الذاكره المؤقته في التيجي*"
end
if matches[1] == "رفع مطور" then
if not matches[2] and msg.reply_id then
tdcli_function ({ID = "GetMessage",chat_id_ = msg.to.id,message_id_ = msg.reply_id}, action_by_reply, {chat_id=msg.to.id,cmd="رفع مطور"})
end
if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({ID = "GetUser",user_id_ = matches[2],}, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="رفع مطور"})
end
if matches[2] and not string.match(matches[2], '^%d+$') then
tdcli_function ({ID = "SearchPublicChat",username_ = matches[2]}, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="رفع مطور"})
end
end
if matches[1] == "تنزيل مطور" then
if not matches[2] and msg.reply_id then
tdcli_function ({ID = "GetMessage",chat_id_ = msg.to.id,message_id_ = msg.reply_id}, action_by_reply, {chat_id=msg.to.id,cmd="تنزيل مطور"})
end
if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({ID = "GetUser",user_id_ = matches[2],}, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="تنزيل مطور"})
end
if matches[2] and not string.match(matches[2], '^%d+$') then
tdcli_function ({ID = "SearchPublicChat",username_ = matches[2]}, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="تنزيل مطور"})
end
end
if matches[1] == "ضع صوره للترحيب" then
redis:setex(sy..'welcom_ph:witting'..msg.from.id,300,true)
return'☢￤ حسننا عزيزي 🍁\n☢￤ الان قم بارسال الصوره للترحيب 🛠'
end
if matches[1] == "صوره الترحيب" then
local msg_welcom = [[☢￤ مـرحبآ آنآ بوت آسـمـي ]]..bot_name..[[ 🛠
☢￤ آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
☢￤ مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
⚖️¦ مـعرف آلمـطـور  : ]]..sudouser..[[ 🌿
👨🏽‍🔧]]
return tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, "./data/photo/sy.jpg",msg_welcom,dl_cb,nil)
end
end


if matches[1] == 'المطورين' and is_sudo(msg) then
return sudolist(msg)
end

if matches[1] == 'المجموعات' and is_sudo(msg) then
return chat_num(msg)
end

if matches[1] == 'قائمه المجموعات' and is_sudo(msg) then
return chat_list(msg)
end

if matches[1] == 'تعطيل' and string.match(matches[2], '^-%d+$') and is_sudo(msg) then
redis:del(sy..'group:add'..matches[2]) 
redis:srem(sy..'group:ids',msg.to.id)
redis:del(sy..'group:name'..matches[2]) 
redis:del(sy..'lock_link'..matches[2]) 
redis:del(sy..'lock_id'..matches[2]) 
redis:del(sy..'lock_id'..matches[2]) 
redis:del(sy..'replay'..matches[2]) 
redis:del(sy..'lock_webpage'..matches[2]) 
redis:del(sy..'lock_markdown'..matches[2]) 
redis:del(sy..'flood'..matches[2]) 
redis:del(sy..'lock_bots'..matches[2]) 
redis:del(sy..'mute_forward'..matches[2]) 
redis:del(sy..'mute_contact'..matches[2]) 
redis:del(sy..'mute_location'..matches[2]) 
redis:del(sy..'mute_document'..matches[2]) 
redis:del(sy..'mute_keyboard'..matches[2]) 
redis:del(sy..'mute_game'..matches[2]) 
redis:del(sy..'mute_inline'..matches[2]) 
redis:del(sy..'num_msg_max'..matches[2]) 
redis:del(sy..'admins:'..matches[2])
redis:del(sy..'whitelist:'..matches[2])
redis:del(sy..'owners:'..matches[2])
tdcli.changeChatMemberStatus(matches[2], our_id, 'Left', dl_cb, nil)
return '📛¦_ تم تعطيل المجموعه_ *'..matches[2]..'* _ومغادرتها_ \n بامر المطور '..sudouser..' 🌿'
end

if matches[1] == 'السورس' then
tdcli.sendMessage(msg.to.id, msg.id, 1, _config.info_text, 1, 'md')
end
if msg.to.type == 'channel' or msg.to.type == 'chat' and redis:get(sy..'group:add'..msg.to.id) then

if matches[1] == 'شحن' and matches[2] and is_sudo(msg) then
			if tonumber(matches[2]) > 0 and tonumber(matches[2]) < 1001 then
				local extime = (tonumber(matches[2]) * 86400)
				redis:setex(sy..'ExpireDate:'..msg.to.id, extime, true)
				if not redis:get(sy..'CheckExpire::'..msg.to.id) then
					redis:set(sy..'CheckExpire::'..msg.to.id,true)
				end
tdcli.sendMessage(msg.to.id, msg.id_, 1, '💂🏻‍♀️¦ تم شحن الاشتراك الى `'..matches[2]..'` يوم   ... 👍🏿', 1, 'md')
tdcli.sendMessage(SUDO, 0, 1, '💂🏻‍♀️¦ تم شحن الاشتراك الى `'..matches[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️¦ في مجموعه ::  '..msg.to.title, 1, 'md')

			else
tdcli.sendMessage(msg.to.id, msg.id_, 1, '💂🏻‍♀️¦ عزيزي المطور ✋🏿\n👨🏻‍🔧¦ شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃', 1, 'md')
			end
		end

if matches[1]:lower() == 'الاشتراك' and matches[2] then 
		if matches[2] == '1' then
			local timeplan1 = 2592000
			redis:setex(sy..'ExpireDate:'..msg.to.id, timeplan1, true)
			if not redis:get(sy..'CheckExpire::'..msg.to.id) then
				redis:set(sy..'CheckExpire::'..msg.to.id,true)
			end
				tdcli.sendMessage(SUDO, msg.id_, 1, '💂🏻‍♀️¦ تم تفعيل الاشتراك  👍🏿\n📆¦  الاشتراك : `30 يوم`  *(شهر)*', 1, 'md')
				tdcli.sendMessage(msg.to.id, 0, 1, '💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك : `30 يوم`  *(شهر)*', 1, 'md')
		end
		if matches[2] == '2' then
			local timeplan2 = 7776000
			redis:setex(sy..'ExpireDate:'..msg.to.id,timeplan2,true)
			if not redis:get(sy..'CheckExpire::'..msg.to.id) then
			redis:set(sy..'CheckExpire::'..msg.to.id,true)
			end
			tdcli.sendMessage(SUDO, msg.id_, 1, '💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك : `90 يوم`  *(3 اشهر)*', 1, 'md')
			tdcli.sendMessage(msg.to.id, 0, 1, '💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك : `90 يوم`  *(3 اشهر)*', 1, 'md')
		
		end
		if matches[2] == '3' then
			redis:set(sy..'ExpireDate:'..msg.to.id,true)
			if not redis:get(sy..'CheckExpire::'..msg.to.id) then
				redis:set(sy..'CheckExpire::'..msg.to.id,true)
			end
				tdcli.sendMessage(SUDO, msg.id_, 1, '💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك : `مفتوح`  *(مدى الحياه)*', 1, 'md')
				tdcli.sendMessage(msg.to.id, 0, 1, '💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك : `مفتوح`  *(مدى الحياه)*', 1, 'md')
		end
		end

if matches[1]:lower() == 'الاشتراك'  and is_mod(msg) and not matches[2] then
			local check_time = redis:ttl(sy..'ExpireDate:'..msg.to.id)
			year = math.floor(check_time / 31536000)
			byear = check_time % 31536000 
			month = math.floor(byear / 2592000)
			bmonth = byear % 2592000 
			day = math.floor(bmonth / 86400)
			bday = bmonth % 86400 
			hours = math.floor( bday / 3600)
			bhours = bday % 3600 
			min = math.floor(bhours / 60)
			sec = math.floor(bhours % 60)
				if check_time == -1 then
				remained_expire = '*مـفـتـوح *🛠'
				elseif tonumber(check_time) > 1 and check_time < 60 then
				remained_expire = '💳¦  `باقي من الاشتراك `:: * \n 📆¦  '..sec..'* _ثانيه_'
				elseif tonumber(check_time) > 60 and check_time < 3600 then
				remained_expire = '💳¦  `باقي من الاشتراك `:: '..min..' *دقيقه و * *'..sec..'* ثانيه'
				elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
				remained_expire = '💳¦  `باقي من الاشتراك `:: * \n 📆¦  '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
				elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
				remained_expire = '💳¦  `باقي من الاشتراك `:: * \n 📆¦  '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
				elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
				remained_expire = '💳¦  `باقي من الاشتراك `:: * \n 📆¦  '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
				elseif tonumber(check_time) > 31536000 then
					remained_expire = '💳¦  `باقي من الاشتراك `:: * \n 📆¦   \n 📆¦  '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
				end
				tdcli.sendMessage(msg.to.id, msg.id_, 1, remained_expire, 1, 'md')

		end
	
if matches[1] == "الرتبه" and not matches[2] and msg.reply_id then
tdcli_function ({
ID = "GetMessage",
chat_id_ = msg.to.id,
message_id_ = msg.reply_id
}, action_by_reply, {chat_id=msg.to.id,cmd="الرتبه"})
end

if matches[1] == "كشف الادمن" and not matches[2] and is_owner(msg) then
local checkmod = false
tdcli.getChannelMembers(msg.to.id, 0, 'Administrators', 200, function(a, b)
local secchk = true
for k,v in pairs(b.members_) do
if v.user_id_ == tonumber(our_id) then
secchk = false
end
end
if secchk then
return tdcli.sendMessage(msg.to.id, msg.id, 1, '☢￤ كلا البوت ليس ادمن في المجموعه ♨️', 1, "md")
else
return tdcli.sendMessage(msg.to.id, msg.id, 1, '☢￤ نعم انه ادمن في المجموعه 👍🏿', 1, "md")
end
end, nil)
end

if matches[1] == "مواليدي" then
local kyear = tonumber(os.date("%Y"))
local kmonth = tonumber(os.date("%m"))
local kday = tonumber(os.date("%d"))
--
local agee = kyear - matches[2]
local ageee = kmonth - matches[3]
local ageeee = kday - matches[4]

return  " 👮🏼 مرحبا عزيزي"
.."\n👮🏼 لقد قمت بحسب عمرك 🛠  \n\n"

.."☢￤ "..agee.." سنه\n"
.."☢￤ "..ageee.." اشهر \n"
.."☢￤ "..ageeee.." يوم \n\n"

end

if matches[1]== 'رسائلي' or matches[1]=='رسايلي' then
local msgs = tonumber(redis:get(sy..'msgs:'..msg.from.id..':'..msg.to.id) or 0)
return '📬￤ عدد رسائلك المرسله : `'..msgs..'` رساله \n\n'
end

if (matches[1]:lower() == 'السيرفر' or matches[1]:lower() == 'server') and is_sudo(msg)  then
local sy = io.popen([[
#!/bin/bash
memTotal_b=`free -b |grep Mem |awk '{print $2}'`
memFree_b=`free -b |grep Mem |awk '{print $4}'`
memBuffer_b=`free -b |grep Mem |awk '{print $6}'`
memCache_b=`free -b |grep Mem |awk '{print $7}'`
memTotal_m=`free -m |grep Mem |awk '{print $2}'`
memFree_m=`free -m |grep Mem |awk '{print $4}'`
memBuffer_m=`free -m |grep Mem |awk '{print $6}'`
memCache_m=`free -m |grep Mem |awk '{print $7}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
hdd=`df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1`
uptime=`uptime`
ProcessCnt=`ps -A | wc -l`
memUsed_b=$(($memTotal_b-$memFree_b-$memBuffer_b-$memCache_b))
memUsed_m=$(($memTotal_m-$memFree_m-$memBuffer_m-$memCache_m))
memUsedPrc=$((($memUsed_b*100)/$memTotal_b))

echo "🃏￤Memory Total: $memTotal_m MB"
echo "🃏￤Memory Used: $memUsed_m MB - $memUsedPrc% used!"
echo '🃏￤CPU Usage : '"$CPUPer"'%'
echo '🃏￤SSD : '"$hdd"'%'
echo '🃏￤Processes : '"$ProcessCnt"
echo '🃏￤Uptime : '"$uptime"
echo "🛠-Đєⱴ Ϲḫ₳ͷͷєℓ: @DevJason"
]]):read('*all')
return sy3boss
end

if matches[1]:lower() == 'معلوماتي' or matches[1]:lower() == 'موقعي'  then
if msg.from.first_name then
if msg.from.username then username = '@'..check_markdown(msg.from.username)
else username = '_ما مسوي  😹💔_'
end
if we_sudo(msg) then
rank = 'المطور الاساسي 🛠'
elseif is_sudo(msg) then rank = 'المطور مالتي 😻'
elseif is_owner(msg) then rank = 'مدير المجموعه 😽'
elseif is_sudo(msg) then rank = 'اداري في البوت 😼'
elseif is_mod(msg) then rank = 'ادمن في البوت 😺'
elseif is_whitelist(msg.from.id,msg.to.id)  then rank = 'عضو مميز 🛠'
else rank = 'فقط عضو 😹'
end
local text = '*👨🏽‍🔧¦ اهـلا بـك عزيزي :\n\n☢￤ الاسم الاول :* _'..msg.from.first_name
..'_\n*☢￤ الاسم الثاني :* _'..(msg.from.last_name or "---")
..'_\n*☢￤ المعرف:* '..username
..'\n*☢￤ الايدي :* ( `'..msg.from.id
..'` )\n*☢￤ ايدي الكروب :* ( `'..msg.to.id
..'` )\n*☢￤ موقعك :* _'..rank
..'_\n*☢￤ مـطـور البوت *: '..sudouser..'\n👨🏽‍🔧'
tdcli.sendMessage(msg.to.id, msg.id_, 1, text, 1, 'md')
end
end

if matches[1] == "الاوامر" then
if not is_mod(msg) then return "☢￤ للاداريين فقط 🛠" end
local text = [[
☢￤ الاوامـر الـ؏ـامـه
☢￤ـ♾♾♽♾♽♾
☢￤ `م1 `➙ اوامر الاداره
☢￤ `م2` ➙ اوامر اعدادات المجموعه
☢￤ `م3` ➙ اوامر الحـمـايـه
☢￤ `م4` ➙ الاوامـر الـ؏ـامـه
☢￤ `م المطور` ➙ اوامر المطور
☢￤ `اوامر الرد` ➙ لاضافه رد معين
☢￤ `اوامر الزخرفه` ➙ لزخرفه الكلمات
☢￤ `اوامر الملفات` ➙ لاضافه وتفعيل وحذف الملفات
☢￤ـ♾♾♽♾♽♾
📬¦ راسلني للاستفسار 🔎 ]]..sudouser
return tdcli.sendMessage(msg.to.id, msg.id, 1, text, 1, 'md')
end

if matches[1]== 'م1' then
if not is_mod(msg) then return "☢￤ للاداريين فقط 🛠" end
local text =[[
🛠  اوامر الرفع والتنزيل📍
☢￤ـ♾♾♽♾♽♾
☢￤ `رفع ادمن `: لرفع ادمن في البوت
☢￤ `تنزيل ادمن` : لتنزيل ادمن من البوت
☢￤ `رفع عضو مميز` : لرفع عضو مميز في البوت
☢￤ `تنزيل عضو مميز` : لتنزيل عضو مميز من البوت
☢￤♾♾♽♾♽♾
📬 اوامر الطرد والحضر 🀄️
☢￤ `طرد بالرد` : لطرد العضو 
☢￤ `طرد + المعرف `: لطرد العضو
☢￤ `حظر بالرد `: لحظر وطرد عضو 
☢￤ `حظر + المعرف `: لحظر وطرد عضو 
☢￤ `الغاء الحظر `: لالغاء الحظر عن عضو 
☢￤ `منع `: لمنع كلمه داخل المجموعه
☢￤ `الغاء منع `: لالغاء منع الكلمه  
☢￤ `كتم ` : لكتم عضو بواسطه الرد
☢￤ `الغاء الكتم`  : لالغاء الكتم بواسطه الرد
☢￤ـ♾♾♽♾♽♾
📬¦ راسلني للاستفسار 🔎 ]]..sudouser
return tdcli.sendMessage(msg.to.id, 1, 1, text, 1, 'md')

end

if matches[1]== 'م2' then
if not is_mod(msg) then return "☢￤ للاداريين فقط 🛠" end
local text = [[
📌 اوامر الوضع للمجموعه 🀄️

☢￤ـ♾♾♽♾♽♾
☢￤ `ضع الترحيب + الكلمه`  :↜ لوضع ترحيب  
☢￤ `ضع قوانين` :↜ لوضع قوانين 
☢￤ `ضع وصف `:↜ لوضع وصف  
☢￤ `ضـع رابط` :↜ لوضع الرابط  
☢￤ `الـرابـط `:↜  لعرض الرابط  
☢￤ـ♾♾♽♾♽♾

📌 اوامر رؤيه الاعدادات 🀄️

☢￤ `القوانين `: لعرض  القوانين 
☢￤ `الادمنيه` : لعرض  الادمنيه 
☢￤ `المدراء `: لعرض  الاداريين 
☢￤ `المكتومين` :↜لعرض  المكتومين 
☢￤ `المطور` : لعرض معلومات المطور 
☢￤ `معلوماتي `:↜لعرض معلوماتك  
☢￤ `الحمايه` : لعرض كل الاعدادات  
☢￤ `الوسائط `: لعرض اعدادات الميديا 
☢￤ `الاعدادات `: لعرض اعدادات المجموعه 
☢￤ `المجموعه` : لعرض معلومات المجموعه 
☢￤ـ♾♾♽♾♽♾
📬¦ راسلني للاستفسار 🔎 ]]..sudouser
return tdcli.sendMessage(msg.to.id, 1, 1, text, 1, 'md')

end

if matches[1]== 'م3' then
if not is_mod(msg) then return "☢￤ للاداريين فقط 🛠" end
local text = [[
⚡️ اوامر حمايه المجموعه ⚡️
☢￤ـ♾♾♽♾♽♾ـ
☢￤️ `قفل ┇ فتح `:  التثبيت
☢￤️ `قفل ┇ فتح `:  التعديل
☢￤️ `قفل ┇ فتح `:  البصمات
☢￤️ `قفل ┇ فتح `:  الــفيديو
☢￤️ `قفل ┇ فتح `: الـصـوت 
☢￤️ `قفل ┇ فتح `:  الـصــور 
☢￤️ `قفل ┇ فتح` :  الملصقات
☢￤️ `قفل ┇ فتح `:  المتحركه
☢￤️ `قفل ┇ فتح` : الدردشه
☢￤️ `قفل ┇ فتح `: الروابط
☢￤️ `قفل ┇ فتح `: التاك
☢￤️ `قفل ┇ فتح `: البوتات
☢￤️ `قفل ┇ فتح `: البوتات بالطرد
☢￤️ `قفل ┇ فتح `: الكلايش
☢￤️ `قفل ┇ فتح `: التكرار
☢￤️ `قفل ┇ فتح `:  التوجيه
☢￤️ `قفل ┇ فتح `:  الانلاين
☢￤️ `قفل ┇ فتح `: الجهات 
☢￤️ `قفل ┇ فتح `: المجموعه 
☢￤️ `قفل ┇ فتح` : الــكـــل
☢￤ـ♾♾♽♾♽♾
📌¦ `تفعيل ┇ تعطيل `: الترحيب 
📬¦ `تفعيل ┇ تعطيل `: الردود 
📢¦ `تفعيل ┇ تعطيل `: التحذير
🗨¦ `تفعيل ┇ تعطيل `: الايدي
☢￤ـ♾♾♽♾♽♾
📬¦ راسلني للاستفسار 🔎 ]]..sudouser

return tdcli.sendMessage(msg.to.id, 1, 1, text, 1, 'md')

end

if matches[1]== 'م4' then
if not is_mod(msg) then return "☢￤ للاداريين فقط 🛠" end
local text = [[
📍💭 اوامر اضافيه 🔹🚀🔹
☢￤ـ♾♾♽♾♽♾
🕵🏻 معلوماتك الشخصيه 🙊
☢￤ `اسمي` : لعرض اسمك 🛠
☢￤ `معرفي` : لعرض معرفك 🛠
☢￤ `ايديي` : لعرض ايديك 🛠
☢￤ `رقمي` : لعرض رقمك  🛠
☢￤ـ♾♾♽♾♽♾
☢￤ اوامر التحشيش 😄
📌¦ `تحب` + (اسم الشخص)
📌¦ `بوس `+ (اسم الشخص) 
📌¦ `كول` + (اسم الشخص) 
📌¦ `كله + الرد` + (الكلام) 
☢￤ـ♾♾♽♾♽♾
📬¦ راسلني للاستفسار 🔎 ]]..sudouser
return tdcli.sendMessage(msg.to.id, 1, 1, text, 1, 'md')

end

if matches[1]== "م المطور" then
if not is_sudo(msg) then return "☢￤ للمطوين فقط 🛠" end
local text = [[
📌¦ اوامر المطور 🃏
☢￤ـ♾♾♽♾♽♾
☢￤ `تفعيل` : لتفعيل البوت 
☢￤ `تعطيل` : لتعطيل البوت 
☢￤ `اذاعه` : لنشر كلمه لكل المجموعات
☢￤ `اذاعه خاص` : لنشر كلمه لكل المشتركين خاص
☢￤ `اذاعه عام` : لنشر كلمه لكل المجموعات والخاص
☢￤` اسم بوتك + غادر :` لطرد البوت
☢￤ `مسح الادمنيه` : لمسح الادمنيه 
☢￤ `مسح المميزين` : لمسح الاعضاء المميزين 
☢￤ `مسح المدراء` : لمسح المدراء 
☢￤ `تحديث`: لتحديث ملفات البوت
☢￤ `تحديث السورس`: لتحديث السورس الى اصدار احدث
☢￤ـ♾♾♽♾♽♾

📬¦ راسلني للاستفسار 🔎 ]]..sudouser
return tdcli.sendMessage(msg.to.id, 1, 1, text, 1, 'md')

end

if matches[1]== 'اوامر الرد' then
if not is_owner(msg) then return "☢￤ للمدراء فقط 🛠" end

local text = [[
📬¦ جميع اوامر الردود 
☢￤ـ♾♾♽♾♽♾
☢￤ `الردود `: لعرض الردود المثبته
☢￤ `اضف رد` : لأضافه رد جديد
☢￤` مسح رد ` الرد المراد مسحه
☢￤ `مسح الردود `: لمسح كل الردود
☢￤ـ♾♾♽♾♽♾
📬¦ راسلني للاستفسار 🔎 ]]..sudouser
return tdcli.sendMessage(msg.to.id, 1, 1, text, 1, 'md')

end

if matches[1]== "اوامر الزخرفه" then
if not is_mod(msg) then return "☢￤ للاداريين فقط 🛠" end
local text = [[☔️¦ اوامر الزخرفهه 🌑

☢￤ زخرف + الكلمه المراد زخرفتها بالانكلش 🍃
☢￤ زخرفه + الكلمه المراد زخرفتها بالعربي 🍃

]]
return tdcli.sendMessage(msg.to.id, 1, 1, text, 1, 'md')

end

if matches[1]== "اوامر الملفات" then
if not we_sudo(msg) then return "☔️هذا الاوامر للمطور الاساسي فقط 🌑" end
local text = [[☔️¦ اوامر الملفات 🌑

☢￤ /p  لعرض قائمه الملفات السورس 🍃
☢￤ /p + اسم الملف المراد تفعيله 🍃
☢￤ /p - اسم الملف المراد تعطيله 🍃
☢￤ sp + الاسم | لارسال الملف اليك 🍃
☢￤ dp + اسم الملف المراد حذفه 🍃
☢￤ sp all | لارسالك كل ملفات السورس 🍃

]]
return tdcli.sendMessage(msg.to.id, 1, 1, text, 1, 'md')
end
end
if matches[1] == "المطور" then
local text = [[☢￤ اهلا بك في سورس العراب 🔎


☢￤ Version 18 ⇔ 18 الاصدار  

☢￤ المطور ⇔

☢￤   ]]..sudouser..[[

☢￤ قناه السورس ⇔
☢￤ Channel ⇔ @DevJason

☢￤ رابط Github Api ⇔
☢￤ https://github.com/alarrab2/sy
]]

return tdcli.sendMessage(msg.to.id, msg.id, 1, text, 1, 'md')
end

if matches[1] == "/git" then
if not is_mod(msg) then return 'للاداريين فقط' end
     url = "https://api.github.com/users/"..URL.escape(matches[2])
     jstr, res = https.request(url)
     jdat = JSON.decode(jstr)
  if jdat.message then
     return '🚸 ¦ اليوزر غير موجود في الـGithub' 
     end
    text = '🎟¦ الاسم : '..(jdat.name or 'لا يوجد اسم')..'\n🔅¦ البايو : '..(jdat.bio or 'لا يوجد بايو')..'\n🔅¦ المتابعون : '..jdat.followers..'\n🔅¦ المتابعين : '..jdat.following..'\n🔅¦ المشاريع : '..jdat.public_repos..'\n🔅¦ الرابط : '..jdat.html_url
	 download_to_file(jdat.avatar_url, './data/photo/git_pro.jpg')
	return tdcli.sendPhoto(msg.to.id, msg.id, 0, 1, nil, './data/photo/git_pro.jpg',text,dl_cb,nil)
end

end

function pre_process(msg)
	if msg.to.type ~= 'pv' then
	local chex = redis:get(sy..'CheckExpire::'..msg.to.id)
	local exd = redis:get(sy..'ExpireDate:'..msg.to.id)
	if chex and not exd and not we_sudo(msg) and not is_sudo(msg) then
	local text3 = '🕵🏼️‍♀️¦ انتهى الاشتراك في احد المجموعات ✋🏿\n👨🏾‍🔧¦ المجموعه : `'..msg.to.title..'`🍃\n💂🏻‍♀️¦ ايدي : '..msg.to.id
			local text4 = '🕵🏼️‍♀️¦ انتهى الاشتراك البوت✋🏿\n💂🏻‍♀️¦  سوف اغادر المجموعه فرصه سعيده 👋🏿\n👨🏾‍🔧¦  او راسل المطور للتجديد @ARRAB_H1 🍃'
			tdcli.sendMessage(SUDO, 0, 1, text3, 1, 'md')
			tdcli.sendMessage(msg.to.id, 0, 1, text4, 1, 'md')
			botrem(msg)
			else
			local expiretime = redis:ttl(sy..'ExpireDate:'..msg.to.id)
			local day = (expiretime / 86400)
			if tonumber(day) > 0.208 and not is_sudo(msg) and is_mod(msg) then
			warning(msg)
			end
		end
	end
end

return { 
patterns = {   
"^(/git) (.*)$", 
"^(صوره الترحيب)$", 
"^(ضع صوره للترحيب)$", 
"^(ضع اسم للبوت)$", 
"^(server)$", 
"^(كشف الادمن)$", 
"^(م المطور)$", 
"^(اوامر الرد)$", 
"^(اوامر الزخرفه)$", 
"^(اوامر الملفات)$", 
"^(الاوامر)$", 
"^(م1)$", 
"^(م2)$", 
"^(م3)$", 
"^(م4)$", 
"^(الرتبه)$", 
"^(رفع مطور)$", 
"^(تنزيل مطور)$",
"^(المطورين)$",
"^(رفع مطور) (.*)$",
"^(تنزيل مطور) (.*)$",
"^(المطور)$", 
"^(السورس)$",
"^(قائمه المجموعات)$",
"^(المجموعات)$",
"^(رسائلي)$",
"^(رسايلي)$",
"^(معلوماتي)$",
"^(السيرفر)$",
"^(موقعي)$",
"^(تنظيف البوت)$",
"^(تعطيل) (-%d+)$",
"^(مواليدي) (.+)/(.+)/(.+)",
"^(الاشتراك)$", 
"^(الاشتراك) ([123])$", 
"^(شحن) (%d+)$", 
"^(الاشتراك)$", 
}, 
run = moody,
pre_process = pre_process
}

-- BY MOHAMMED HISHAM
-- BY @ARRAB_H1
-- BY @DevJason
-- V18
