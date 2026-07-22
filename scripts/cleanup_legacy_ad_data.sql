-- 仅用于已有部署的升级清理；新部署不需要执行。
-- 执行前先备份数据库。

START TRANSACTION;

DELETE FROM xy_system_settings
WHERE `key` IN (
  'auth.footer_ad_html',
  'ad_price.carousel',
  'ad_price.text'
);

COMMIT;

-- 确认上面的设置已清理后，删除历史广告数据表：
DROP TABLE IF EXISTS xy_advertisements;
