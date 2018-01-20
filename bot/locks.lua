-- BY @ARRAB_H1
-- BY @DevJason

---------------Lock brod-------------------
function lock_brod(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if not redis:get(sy..'lock_brod') then
return '❖￤اذاعه المطورين بالتاكيد تم تعطيلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:del(sy..'lock_brod')
return '❖￤تم تعطيل اذاعه المطورين ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
function unlock_brod(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if redis:get(sy..'lock_brod') then
return '❖￤اذاعه المطورين بالتاكيد تم تفعيلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:set(sy..'lock_brod',true)
return '❖￤تم تفعيل اذاعه المطورين ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Lock replay-------------------
function lock_replay(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if not redis:get(sy..'replay'..msg.to.id) then
return '❖￤الردود بالتاكيد تم تعطيلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:del(sy..'replay'..msg.to.id)
return '❖￤تم تعطيل الردود ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_replay(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if redis:get(sy..'replay'..msg.to.id) then
return '❖￤الردود بالتاكيد تم تفعيلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:set(sy..'replay'..msg.to.id,true)
return '❖￤تم تفعيل الردود ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Lock bot service-------------------
function lock_service(msg)
if not we_sudo(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end 
-- حصانه التحقق من العضو --
if not redis:get(sy..'lock_service') then
return '❖￤  تم بالتاكيد تعطيل نظام البوت خدمي ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:del(sy..'lock_service')
return '❖￤تم  تعطيل نظام البوت خدمي ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_service(msg)
if not we_sudo(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'lock_service') then
return '❖￤ تم بالتأكيد تفعيل نظام البوت خدمي ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:set(sy..'lock_service',true)
return '❖￤ تم تفعيل نظام البوت خدمي ✓\n❖￤ اصبح البوت الان بامكان اي شخص\n❖￤ ان يستخدم البوت للتفعيل\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Lock Link-------------------
function lock_link(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if redis:get(sy..'lock_link'..msg.to.id) then
return '❖￤الروابط بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_link'..msg.to.id,true)
return '❖￤تم قفل الروابط ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_link(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if not redis:get(sy..'lock_link'..msg.to.id) then
return '❖￤الروابط بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'lock_link'..msg.to.id)
return '❖￤تم فتح الروابط ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Lock Tag-------------------
function lock_tag(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if redis:get(sy..'lock_tag'..msg.to.id) then
return '❖￤التاك(#) بالتأكيد تم قفله ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_tag'..msg.to.id,true)
return '❖￤تم قفل التاك(#) ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_tag(msg, data, target)

if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if not redis:get(sy..'lock_tag'..msg.to.id) then
return '❖￤التاك(#) بالتأكيد تم فتحه ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'lock_tag'..msg.to.id)
return '❖￤تم فتح التاك(#) ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Lock UserName-------------------
function lock_username(msg, data, target) 

if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --


if redis:get(sy..'lock_username'..msg.to.id) then
return '❖￤المعرفات @ بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_username'..msg.to.id,true)
return '❖￤تم قفل المعرفات @ ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_username(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if not redis:get(sy..'lock_username'..msg.to.id) then
return '❖￤المعرفات @ بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'lock_username'..msg.to.id)
return '❖￤تم فتح المعرفات @ ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Lock Edit-------------------
function lock_edit(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if redis:get(sy..'lock_edit'..msg.to.id) then
return '❖￤التعديل بالتأكيد تم قفله ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_edit'..msg.to.id,true)
return '❖￤تم قفل التعديل ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_edit(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if not redis:get(sy..'lock_edit'..msg.to.id) then
return '❖￤التعديل بالتأكيد تم فتحه ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'lock_edit'..msg.to.id)
return '❖￤تم فتح التعديل ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Lock spam-------------------
function lock_spam(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if   redis:get(sy..'lock_spam'..msg.to.id) then
return '❖￤الكلايش بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_spam'..msg.to.id,true)
return '❖￤تم قفل الكلايش ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_spam(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'lock_spam'..msg.to.id) then
return '❖￤الكلايش بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'lock_spam'..msg.to.id)
return '❖￤تم فتح الكلايش ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Lock Flood-------------------
function lock_flood(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'lock_flood'..msg.to.id) then
return '❖￤التكرار بالتأكيد تم قفله ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_flood'..msg.to.id,true)
return '❖￤تم قفل التكرار ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_flood(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'lock_flood'..msg.to.id) then
return '❖￤التكرار بالتأكيد تم فتحه ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'lock_flood'..msg.to.id)
return '❖￤تم فتح التكرار ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Lock Bots-------------------
function lock_bots(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'lock_bots'..msg.to.id) then
return '❖￤البوتات بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_bots'..msg.to.id,true)
return '❖￤تم قفل البوتات ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_bots(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'lock_bots'..msg.to.id) then
return '❖￤البوتات بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'lock_bots'..msg.to.id)
return '❖￤تم فتح البوتات ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Lock Join-------------------
function lock_join(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'lock_join'..msg.to.id) then
return '❖￤الاضافه بالتاكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_join'..msg.to.id,true)
return '❖￤تم قفل الاضافه ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_join(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'lock_join'..msg.to.id) then
return '❖￤الاضافه بالتاكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'lock_join'..msg.to.id)
return '❖￤تم فتح الاضافه ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Lock Markdown-------------------
function lock_markdown(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'lock_markdown'..msg.to.id) then
return '❖￤الماركدوان بالتاكيد تم قفله ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_markdown'..msg.to.id,true)
return '❖￤تم قفل الماركدوان ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_markdown(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'lock_markdown'..msg.to.id) then
return '❖￤الماركدوان بالتأكيد تم فتحه ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'lock_markdown'..msg.to.id)
return '❖￤تم فتح الماركدوان ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Lock Webpage-------------------
function lock_webpage(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'lock_webpage'..msg.to.id) then
return '❖￤الويب بالتأكيد تم قفله ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_webpage'..msg.to.id,true)
return '❖￤تم قفل الويب ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_webpage(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'lock_webpage'..msg.to.id) then
return '❖￤الويب بالتأكيد تم فتحه ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:set(sy..'lock_webpage'..msg.to.id,true)
return '❖￤تم فتح الويب ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Gif-------------------
function mute_gif(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_gif'..msg.to.id) then
return '❖￤المتحركه بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_gif'..msg.to.id,true)
return '❖￤تم قفل المتحركه ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_gif(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_gif'..msg.to.id) then
return '❖￤المتحركه بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_gif'..msg.to.id)
return '❖￤تم فتح المتحركه ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Game-------------------
function mute_game(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_game'..msg.to.id) then
return '❖￤الالعاب بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:ser('mute_game'..msg.to.id,true)
return '❖￤تم قفل الالعاب ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_game(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_game'..msg.to.id) then
return '❖￤الألعاب بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_game'..msg.to.id)
return '❖￤تم فتح الألعاب ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Inline-------------------
function mute_inline(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_inline'..msg.to.id) then
return '❖￤الانلاين بالتأكيد تم قفله ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_inline'..msg.to.id,true)
return '❖￤تم قفل الانلاين ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_inline(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_inline'..msg.to.id) then
return '❖￤الانلاين بالتأكيد تم فتحه ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_inline'..msg.to.id)
return '❖￤تم فتح الانلاين ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Text-------------------
function mute_text(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_text'..msg.to.id) then
return '❖￤الدرشه بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_text'..msg.to.id,true)
return '❖￤تم قفل الدردشه ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_text(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_text'..msg.to.id) then
return '❖￤الدردشه بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_text'..msg.to.id,true)
return '❖￤تم فتح الدردشه ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute photo-------------------
function mute_photo(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_photo'..msg.to.id) then
return '❖￤الصور بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_photo'..msg.to.id,true)
return '❖￤تم قفل الصور ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_photo(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_photo'..msg.to.id)then
return '❖￤الصور بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_photo'..msg.to.id)
return '❖￤تم فتح الصور ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Video-------------------
function mute_video(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_video'..msg.to.id) then
return '❖￤الفيديو بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_video'..msg.to.id,true)
return '❖￤تم قفل الفيديو ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_video(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_video'..msg.to.id) then
return '❖￤الفيديو بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_video'..msg.to.id)
return '❖￤تم فتح الفيديو ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Audio-------------------
function mute_audio(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_audio'..msg.to.id) then
return '❖￤البصمات بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_audio'..msg.to.id,true)
return '❖￤تم قفل البصمات ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_audio(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_audio'..msg.to.id) then
return '❖￤البصمات بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_audio'..msg.to.id)
return '❖￤تم فتح البصمات ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Voice-------------------
function mute_voice(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if   redis:get(sy..'mute_voice'..msg.to.id) then
return '❖￤الصوت بالتأكيد تم قفله ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_voice'..msg.to.id,true)
return '❖￤تم قفل الصوت ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_voice(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_voice'..msg.to.id) then
return '❖￤الصوت بالتأكيد تم فتحه ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_voice'..msg.to.id)
return '❖￤تم فتح الصوت ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Sticker-------------------
function mute_sticker(msg, data, target) 

if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --

if   redis:get(sy..'mute_sticker'..msg.to.id) then
return '❖￤الملصقات بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_sticker'..msg.to.id,true)
return '❖￤تم قفل الملصقات ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_sticker(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_sticker'..msg.to.id) then
return '❖￤الملصقات بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_sticker'..msg.to.id)
return '❖￤تم فتح الملصقات ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Contact-------------------
function mute_contact(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_contact'..msg.to.id) then
return '❖￤جهات الاتصال بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_contact'..msg.to.id,true)
return '❖￤تم قفل جهات الاتصال ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_contact(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_contact'..msg.to.id) then
return '❖￤جهات الاتصال بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_contact'..msg.to.id)
return '❖￤تم فتح جهات الاتصال ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Forward-------------------
function mute_forward(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_forward'..msg.to.id) then
return '❖￤التوجيه بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_forward'..msg.to.id,true)
return '❖￤تم قفل التوجيه ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_forward(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_forward'..msg.to.id) then
return '❖￤التوجيه بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_forward'..msg.to.id)
return '❖￤تم فتح التوجيه ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Location-------------------
function mute_location(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_location'..msg.to.id) then
return '❖￤الموقع بالتأكيد تم قفله ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_location'..msg.to.id,true)
return '❖￤تم قفل الموقع ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_location(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_location'..msg.to.id) then
return '❖￤الموقع بالتأكيد تم فتحه ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_location'..msg.to.id)
return '❖￤تم فتح الموقع ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute Document-------------------
function mute_document(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_document'..msg.to.id) then
return '❖￤الملفات بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_document'..msg.to.id,true)
return '❖￤تم قفل الملفات ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_document(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_document'..msg.to.id) then
return '❖￤الملفات بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_document'..msg.to.id)
return '❖￤تم فتح الملفات ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end
---------------Mute TgService-------------------
function mute_tgservice(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_tgservice'..msg.to.id) then
return '❖￤الاشعارات بالتأكيد تم قفلها ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_tgservice'..msg.to.id,true)
return '❖￤تم قفل الاشعارات ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_tgservice(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_tgservice'..msg.to.id) then
return '❖￤الاشعارات بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_tgservice'..msg.to.id)
return '❖￤الاشعارات بالتأكيد تم فتحها ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------Mute Keyboard-------------------
function mute_keyboard(msg, data, target) 
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'mute_keyboard'..msg.to.id) then
return '❖￤الكيبورد بالتأكيد تم قفله ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'mute_keyboard'..msg.to.id,true)
return '❖￤تم قفل الكيبورد ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unmute_keyboard(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶" 
end
-- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'mute_keyboard'..msg.to.id) then
return '❖￤الكيبورد بالتأكيد تم فتحه ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'mute_keyboard'..msg.to.id)
return '❖￤تم فتح الكيبورد ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

---------------lock_bots_by_kick-------------------
function lock_bots_by_kick(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if redis:get(sy..'lock_bots_by_kick'..msg.to.id) then
return '❖￤البوتات بالطرد بالتاكيد تم قفله ✓\n❖￤ بواسطه ⇔ '..moody..''
else
redis:set(sy..'lock_bots_by_kick'..msg.to.id,true)
return '❖￤تم قفل البوتات بالطرد (مع طرد الي ضافه) ✓\n❖￤ بواسطه ⇔ '..moody..''
end
end

function unlock_bots_by_kick(msg, data, target)
if not is_mod(msg) then return "❖￤ هذا الامر يخص الادمنيه فقط  🚶"
 end
 -- حصانه التحقق من العضو --
if is_sudo(msg) then
moody = 'المطور'
elseif is_owner(msg) then
moody = 'المدير'
elseif is_mod(msg) then
moody = 'ادمن'
end
-- حصانه التحقق من العضو --
if not redis:get(sy..'lock_bots_by_kick'..msg.to.id) then
return '❖￤البوتات بالطرد بالتاكيد مفتوحه ✓\n❖￤ بواسطه ⇔ '..moody..''
else 
redis:del(sy..'lock_bots_by_kick'..msg.to.id)
return '❖￤تم فتح البوتات بالطرد ✓\n❖￤ بواسطه ⇔ '..moody..''
end 
end
-- BY @ARRAB_H1
-- BY @DevJason
-- V18
