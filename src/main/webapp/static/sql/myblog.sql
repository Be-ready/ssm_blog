drop table if exists users
create table users(
userId Integer(20) not null auto_increment comment '用户ID' primary key,
userName varchar(20) not null comment '用户名',
userNickname varchar(20) NOT NULL COMMENT '用户昵称',
userPassword varchar(15) not null comment '用户密码',
userProfilePhoto varchar(255) NOT NULL COMMENT '用户头像',
userEmail varchar(30) NOT NULL COMMENT '用户邮箱',
userTelephoneNumber varchar(11) NOT NULL COMMENT '用户手机号',
userRegistrationTime varchar(19) NULL DEFAULT NULL COMMENT '注册时间',
userBirthday varchar(10) NULL DEFAULT NULL COMMENT '用户生日'
)