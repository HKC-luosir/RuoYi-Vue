-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('机器人订单', '2002', '1', 'order', 'udef/order/index', 1, 0, 'C', '0', '0', 'udef:order:list', '#', 'admin', sysdate(), '', null, '机器人订单菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('机器人订单查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'udef:order:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('机器人订单新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'udef:order:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('机器人订单修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'udef:order:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('机器人订单删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'udef:order:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('机器人订单导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'udef:order:export',       '#', 'admin', sysdate(), '', null, '');