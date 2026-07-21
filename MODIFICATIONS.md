# 本次改造说明

## 已移除的广告功能

- 前端仪表盘轮播/文字广告、广告申请、广告管理、登录页页脚推广内容。
- 广告 API、广告数据模型、远程广告拉取逻辑、启动器广告仪表盘与云服务快捷方式。
- 新安装不再创建广告表；已有部署可执行 `scripts/cleanup_legacy_ad_data.sql` 清理遗留设置和数据表。

## 滑块问题修复

`common/services/captcha/slider_stealth.py` 修复了两个会导致“自动过滑块失败”的流程错误：

1. 挑战常被放在跨域 iframe 中，原实现只检查 `page.content()` 的主文档文字，可能把实际存在的滑块误判为“无需验证”。现在会通过 `SliderElementFinder` 扫描所有 frame 后再决定流程。
2. 成功后旧代码先缓存页面 URL、再等待 Cookie 写入；若等待期间页面从验证页跳走，仍会按旧 URL 判定失败并丢弃结果。现在会在等待后重新读取 URL。

## 校验

- `python -m py_compile`：通过。
- `frontend/node_modules/typescript/bin/tsc -p frontend/tsconfig.json`：通过。
