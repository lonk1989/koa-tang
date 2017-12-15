//后台路由配置
import config from './config.js'
import mysql from 'mysql2/promise'
import bcrypt from 'bcryptjs'
import fs from "fs"
import jwt from 'jsonwebtoken'
import common from './common'
import nodemailer from 'nodemailer'

//公用：获取客户端IP
function getClientIP(ctx) {
    let req = ctx.request;
    let ip = ctx.ip ||
        req.headers['x-forwarded-for'] ||
        req.ip ||
        req.connection.remoteAddress ||
        req.socket.remoteAddress ||
        req.connection.socket.remoteAddress || '';
    let arr = ip.match(/(\d{1,3}\.){3}\d{1,3}/);
    return arr ? arr[0] : '';
}

//公用：发送邮件
function sendEmail(email, title, body) {
    return new Promise((resolve, reject) => {
        const transporter = nodemailer.createTransport(config.emailServer, {
            from: '<' + config.emailServer.auth.user + '>',
        });
        transporter.sendMail({
            to: email,
            subject: title,
            html: body,
            watchHtml: body,
        }, (error, info) => {
            transporter.close();
            resolve(error ? error.message : '');
        });
    })
}

//科室列表
async function listDepartment(ctx) {
    let data = ctx.request.body;
    const arr = [];
    let querying = '';
    if(data.name){
        querying += " and name like ?";
        arr.push('%' + data.name + '%');
    }
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT * FROM `department` order by `sort`"+querying.replace('and','where'), arr);
    await connection.end();
    ctx.body = {
        success: true,
        data:{data:list}
    };
}
//保存科室
async function updateDepartment(ctx) {
    let data = ctx.request.body;
    let msg,arr = [];
    const obj = {
        name:'科室名称',
        sort:''
    };
    const array = Object.getOwnPropertyNames(obj);
    array.forEach(key=>{
        if(obj[key]!=='' && data[key]==='' &&!msg){
            msg = obj[key]+'不能为空！';
        }
        arr.push(data[key]);
    });
    if(!msg){
        let id = data.id >> 0;
        const connection = await mysql.createConnection(config.mysqlDB);
        if(id){
            arr.push(id);
            const [result] = await connection.execute(`UPDATE department SET ${array.map(k=>k+'=?').join(',')} where id=?`, arr);
            msg = result.affectedRows === 1 ? '' : '修改失败';
        }else{
            //先检查是否占用帐号
            const [rows] = await connection.execute('SELECT name FROM `department` where `name`=?', [data.name]);
            if(rows.length > 0) {
                msg = '名称已经被占用！';
            }else{
                const [result] = await connection.execute(`INSERT INTO department (${array.join(',')}) VALUES (${array.map((()=>'?')).join(',')})`, arr);
                msg = result.affectedRows === 1 ? '' : '添加失败';
                data.id = result.insertId
            }
        }
        await connection.end();
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {
            data
        }
    }
}
//删除科室
async function deleteDepartment(ctx) {
    const data = ctx.request.body;
    let id = data.id >> 0;
    const connection = await mysql.createConnection(config.mysqlDB);
    const [result] = await connection.execute('DELETE from `department` where id=?',[id]);
    await connection.end();
    ctx.body = {
        success: result.affectedRows === 1,
        message: result.affectedRows === 1 ? '' : `id:${id}删除失败！`,
        data: {}
    }
}
//批量删除科室
async function batchDelDepartment(ctx) {
    const data = ctx.request.body;
    let result = {};
    if(/^\d+(,\d+)*$/.test(data.ids)){
        const connection = await mysql.createConnection(config.mysqlDB);
        const [list] = await connection.execute('DELETE from `department` where id in (' + data.ids + ')');
        result = list;
        await connection.end();
    }
    ctx.body = {
        success: result.affectedRows > 0,
        message: result.affectedRows > 0 ? '' : `ids:${data.ids}删除失败！`,
        data: {}
    }
}


//科室列表
async function listMedicineType(ctx) {
    let data = ctx.request.body;
    const arr = [];
    let querying = '';
    if(data.name){
        querying += " and name like ?";
        arr.push('%' + data.name + '%');
    }
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT * FROM `medicine_type` order by `sort`"+querying.replace('and','where'), arr);
    await connection.end();
    ctx.body = {
        success: true,
        data:{data:list}
    };
}
//保存科室
async function updateMedicineType(ctx) {
    let data = ctx.request.body;
    let msg,arr = [];
    const obj = {
        name:'科室名称',
        sort:''
    };
    const array = Object.getOwnPropertyNames(obj);
    array.forEach(key=>{
        if(obj[key]!=='' && data[key]==='' &&!msg){
            msg = obj[key]+'不能为空！';
        }
        arr.push(data[key]);
    });
    if(!msg){
        let id = data.id >> 0;
        const connection = await mysql.createConnection(config.mysqlDB);
        if(id){
            arr.push(id);
            const [result] = await connection.execute(`UPDATE medicine_type SET ${array.map(k=>k+'=?').join(',')} where id=?`, arr);
            msg = result.affectedRows === 1 ? '' : '修改失败';
        }else{
            //先检查是否占用帐号
            const [rows] = await connection.execute('SELECT name FROM `medicine_type` where `name`=?', [data.name]);
            if(rows.length > 0) {
                msg = '名称已经被占用！';
            }else{
                const [result] = await connection.execute(`INSERT INTO medicine_type (${array.join(',')}) VALUES (${array.map((()=>'?')).join(',')})`, arr);
                msg = result.affectedRows === 1 ? '' : '添加失败';
                data.id = result.insertId
            }
        }
        await connection.end();
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {
            data
        }
    }
}
//删除科室
async function deleteMedicineType(ctx) {
    const data = ctx.request.body;
    let id = data.id >> 0;
    const connection = await mysql.createConnection(config.mysqlDB);
    const [result] = await connection.execute('DELETE from `medicine_type` where id=?',[id]);
    await connection.end();
    ctx.body = {
        success: result.affectedRows === 1,
        message: result.affectedRows === 1 ? '' : `id:${id}删除失败！`,
        data: {}
    }
}
//批量删除科室
async function batchDelMedicineType(ctx) {
    const data = ctx.request.body;
    let result = {};
    if(/^\d+(,\d+)*$/.test(data.ids)){
        const connection = await mysql.createConnection(config.mysqlDB);
        const [list] = await connection.execute('DELETE from `medicine_type` where id in (' + data.ids + ')');
        result = list;
        await connection.end();
    }
    ctx.body = {
        success: result.affectedRows > 0,
        message: result.affectedRows > 0 ? '' : `ids:${data.ids}删除失败！`,
        data: {}
    }
}

//医院列表
async function listHospital(ctx) {
    let data = ctx.request.body;
    const arr = [];
    let querying = '';
    if(data.name){
        querying += " and name like ?";
        arr.push('%' + data.name + '%');
    }
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT * FROM `hospital` order by `sort`"+querying.replace('and','where'), arr);
    await connection.end();
    ctx.body = {
        success: true,
        data:{data:list}
    };
}
//保存医院
async function updateHospital(ctx) {
    let data = ctx.request.body;
    let msg,arr = [];
    const obj = {
        name:'医院名称',
        rank:'',
        sort:''
    };
    const array = Object.getOwnPropertyNames(obj);
    array.forEach(key=>{
        if(obj[key]!=='' && data[key]==='' &&!msg){
            msg = obj[key]+'不能为空！';
        }
        arr.push(data[key]);
    });
    if(!msg){
        let id = data.id >> 0;
        const connection = await mysql.createConnection(config.mysqlDB);
        if(id){
            arr.push(id);
            const [result] = await connection.execute(`UPDATE hospital SET ${array.map(k=>k+'=?').join(',')} where id=?`, arr);
            msg = result.affectedRows === 1 ? '' : '修改失败';
        }else{
            //先检查是否占用帐号
            const [rows] = await connection.execute('SELECT name FROM `hospital` where `name`=?', [data.name]);
            if(rows.length > 0) {
                msg = '名称已经被占用！';
            }else{
                const [result] = await connection.execute(`INSERT INTO hospital (${array.join(',')}) VALUES (${array.map((()=>'?')).join(',')})`, arr);
                msg = result.affectedRows === 1 ? '' : '添加失败';
                data.id = result.insertId
            }
        }
        await connection.end();
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {
            data
        }
    }
}
//删除医院
async function deleteHospital(ctx) {
    const data = ctx.request.body;
    let id = data.id >> 0;
    const connection = await mysql.createConnection(config.mysqlDB);
    const [result] = await connection.execute('DELETE from `hospital` where id=?',[id]);
    await connection.end();
    ctx.body = {
        success: result.affectedRows === 1,
        message: result.affectedRows === 1 ? '' : `id:${id}删除失败！`,
        data: {}
    }
}
//批量删除医院
async function batchDelHospital(ctx) {
    const data = ctx.request.body;
    let result = {};
    if(/^\d+(,\d+)*$/.test(data.ids)){
        const connection = await mysql.createConnection(config.mysqlDB);
        const [list] = await connection.execute('DELETE from `hospital` where id in (' + data.ids + ')');
        result = list;
        await connection.end();
    }
    ctx.body = {
        success: result.affectedRows > 0,
        message: result.affectedRows > 0 ? '' : `ids:${data.ids}删除失败！`,
        data: {}
    }
}


//不适症状列表
async function listSickness(ctx) {
    let data = ctx.request.body;
    const arr = [];
    let querying = '';
    if(data.name){
        querying += " and name like ?";
        arr.push('%' + data.name + '%');
    }
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT * FROM `sickness` order by `sort`"+querying.replace('and','where'), arr);
    await connection.end();
    ctx.body = {
        success: true,
        data:{data:list}
    };
}
//保存不适症状
async function updateSickness(ctx) {
    let data = ctx.request.body;
    let msg,arr = [];
    const obj = {
        name:'不适症状名称',
        department_id: '所属科室',
        icon:'',
        sort:''
    };
    const array = Object.getOwnPropertyNames(obj);
    array.forEach(key=>{
        if(obj[key]!=='' && data[key]==='' &&!msg){
            msg = obj[key]+'不能为空！';
        }
        arr.push(data[key]);
    });
    if(!msg){
        let id = data.id >> 0;
        const connection = await mysql.createConnection(config.mysqlDB);
        if(id){
            arr.push(id);
            const [result] = await connection.execute(`UPDATE sickness SET ${array.map(k=>k+'=?').join(',')} where id=?`, arr);
            msg = result.affectedRows === 1 ? '' : '修改失败';
        }else{
            //先检查是否占用帐号
            const [rows] = await connection.execute('SELECT name FROM `sickness` where `name`=?', [data.name]);
            if(rows.length > 0) {
                msg = '名称已经被占用！';
            }else{
                const [result] = await connection.execute(`INSERT INTO sickness (${array.join(',')}) VALUES (${array.map((()=>'?')).join(',')})`, arr);
                msg = result.affectedRows === 1 ? '' : '添加失败';
                data.id = result.insertId
            }
        }
        await connection.end();
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {
            data
        }
    }
}
//删除不适症状
async function deleteSickness(ctx) {
    const data = ctx.request.body;
    let id = data.id >> 0;
    const connection = await mysql.createConnection(config.mysqlDB);
    const [result] = await connection.execute('DELETE from `sickness` where id=?',[id]);
    await connection.end();
    ctx.body = {
        success: result.affectedRows === 1,
        message: result.affectedRows === 1 ? '' : `id:${id}删除失败！`,
        data: {}
    }
}
//批量删除不适症状
async function batchDelSickness(ctx) {
    const data = ctx.request.body;
    let result = {};
    if(/^\d+(,\d+)*$/.test(data.ids)){
        const connection = await mysql.createConnection(config.mysqlDB);
        const [list] = await connection.execute('DELETE from `sickness` where id in (' + data.ids + ')');
        result = list;
        await connection.end();
    }
    ctx.body = {
        success: result.affectedRows > 0,
        message: result.affectedRows > 0 ? '' : `ids:${data.ids}删除失败！`,
        data: {}
    }
}

//药品列表
async function listMedicine(ctx) {
    let data = ctx.request.body;
    const arr = [];
    let querying = '';
    if(data.name){
        querying += " and name like ?";
        arr.push('%' + data.name + '%');
    }
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT * FROM `medicine` order by `sort`"+querying.replace('and','where'), arr);
    await connection.end();
    ctx.body = {
        success: true,
        data:{data:list}
    };
}
//保存药品
async function updateMedicine(ctx) {
    let data = ctx.request.body;
    let msg,arr = [];
    const obj = {
        name:'药品名称',
        medicine_type_id: '药品类别',
        unit:'单位',
        price:'价格',
        spec:'',
        sort:''
    };
    const array = Object.getOwnPropertyNames(obj);
    array.forEach(key=>{
        if(obj[key]!=='' && data[key]==='' &&!msg){
            msg = obj[key]+'不能为空！';
        }
        arr.push(data[key]);
    });
    if(!msg){
        let id = data.id >> 0;
        const connection = await mysql.createConnection(config.mysqlDB);
        if(id){
            arr.push(id);
            const [result] = await connection.execute(`UPDATE medicine SET ${array.map(k=>k+'=?').join(',')} where id=?`, arr);
            msg = result.affectedRows === 1 ? '' : '修改失败';
        }else{
            //先检查是否占用帐号
            const [rows] = await connection.execute('SELECT name FROM `medicine` where `name`=?', [data.name]);
            if(rows.length > 0) {
                msg = '名称已经被占用！';
            }else{
                const [result] = await connection.execute(`INSERT INTO medicine (${array.join(',')}) VALUES (${array.map((()=>'?')).join(',')})`, arr);
                msg = result.affectedRows === 1 ? '' : '添加失败';
                data.id = result.insertId
            }
        }
        await connection.end();
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {
            data
        }
    }
}
//删除药品
async function deleteMedicine(ctx) {
    const data = ctx.request.body;
    let id = data.id >> 0;
    const connection = await mysql.createConnection(config.mysqlDB);
    const [result] = await connection.execute('DELETE from `medicine` where id=?',[id]);
    await connection.end();
    ctx.body = {
        success: result.affectedRows === 1,
        message: result.affectedRows === 1 ? '' : `id:${id}删除失败！`,
        data: {}
    }
}
//批量删除药品
async function batchDelMedicine(ctx) {
    const data = ctx.request.body;
    let result = {};
    if(/^\d+(,\d+)*$/.test(data.ids)){
        const connection = await mysql.createConnection(config.mysqlDB);
        const [list] = await connection.execute('DELETE from `medicine` where id in (' + data.ids + ')');
        result = list;
        await connection.end();
    }
    ctx.body = {
        success: result.affectedRows > 0,
        message: result.affectedRows > 0 ? '' : `ids:${data.ids}删除失败！`,
        data: {}
    }
}

//用户列表
async function listUser(ctx) {
    let data = ctx.request.body;
    const arr = [];
    let querying = '';
    if(data.user_name){
        querying += " and user_name like ?";
        arr.push('%' + data.user_name + '%');
    }
    if(data.user_email){
        querying += " and user_email like ?";
        arr.push('%' + data.user_email + '%');
    }
    if(/^[1-4]$/.test(data.user_type)){
        querying += " and user_type=?";
        arr.push(data.user_type >> 0);
    }
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT * FROM `user`"+querying.replace('and','where'), arr);
    await connection.end();
    list.forEach(obj=>{
        obj.user_email = '****'+obj.user_email.slice(4);//过滤邮箱地址
        obj.user_pass = '';
    });
    ctx.body = {
        success: true,
        data:{data:list}
    };
}

//医生列表
async function listDoctor(ctx) {
    let data = ctx.request.body;
    const arr = [];
    let querying = '';
    if(data.name){
        querying += " and name like ?";
        arr.push('%' + data.name + '%');
    }
    if(data.phone){
        querying += " and phone like ?";
        arr.push('%' + data.phone + '%');
    }
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT * FROM `doctor`"+querying.replace('and','where'), arr);
    await connection.end();
    list.forEach(obj=>{
        obj.phone = '****'+obj.phone.slice(4);//过滤手机号码
    });
    ctx.body = {
        success: true,
        data:{data:list}
    };
}

async function getDoctorById(ctx) {
    const data = ctx.request.body;
    let id = data.id >> 0;
    let msg;
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT * FROM doctor where id=?", [id]);
    const obj = list[0];
    await connection.end();
    ctx.body = {
        success: !msg,
        message: msg,
        data: !msg ? obj : {}
    }
}

//新添或编辑医生
async function updateDoctor(ctx) {
    const data = ctx.request.body;
    let msg,arr = [];
    const obj = {
        name:'医生姓名',
        phone:'医生电话',
        sex:'',
        hospital_id:'',
        hospital:'',
        avatar:'',
        rank:'',
        price:'',
        consult_price:'',
        notice:'',
        adept:'',
        about:'',
        intro:'',
        sort:''
    };
    const array = Object.getOwnPropertyNames(obj);
    array.forEach(key=>{
        if(obj[key]!=='' && data[key]==='' &&!msg){
            msg = obj[key]+'不能为空！';
        }
        arr.push(data[key]);
    });
    if(!msg){
        const user = ctx.state.userInfo;//获取用户信息
        const connection = await mysql.createConnection(config.mysqlDB);
        if(data.id > 0){
            //编辑文章
            arr.push(data.id);
            const [result] = await connection.execute(`UPDATE doctor SET ${array.map(k=>k+'=?').join(',')} where id=?`, arr);
            msg = result.affectedRows === 1 ? '' :'医生修改失败';
        }else{
            //添加医生
            const [result] = await connection.execute(`INSERT INTO doctor (${array.join(',')}) VALUES (${array.map((()=>'?')).join(',')})`, arr);
            msg = result.affectedRows === 1 ? '' :'医生添加失败';
        }
        await connection.end();
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {}
    }
}

async function deleteDoctor(ctx){
    const data = ctx.request.body;
    let ids = data.ids;
    let msg;
    if(/^\d+(,\d+)*$/.test(ids)){
        const arr = ids.split(',');
        let sql = `DELETE from doctor where id in (${arr.map(() => '?').join(',')})`;
        const connection = await mysql.createConnection(config.mysqlDB);
        const [result] = await connection.execute(sql, arr);
        msg = result.affectedRows > 0 ? '':'删除医生失败！';
        await connection.end();
    }else{
        msg = 'ID参数不合法';
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {}
    }
}

//患者列表
async function listPatient(ctx) {
    let data = ctx.request.body;
    const arr = [];
    let querying = '';
    if(data.name){
        querying += " and name like ?";
        arr.push('%' + data.name + '%');
    }
    if(data.phone){
        querying += " and phone like ?";
        arr.push('%' + data.phone + '%');
    }
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT * FROM `doctor`"+querying.replace('and','where'), arr);
    await connection.end();
    list.forEach(obj=>{
        obj.phone = '****'+obj.phone.slice(4);//过滤手机号码
    });
    ctx.body = {
        success: true,
        data:{data:list}
    };
}

async function regPatient(ctx) {
    let data = ctx.request.body
    let msg,arr = [];
    const obj = {
        username:'用户名',
        password:'用户密码'
    };
    const array = Object.getOwnPropertyNames(obj);
    array.forEach(key=>{
        if(data[key]==='' && key !=='user_pic' &&!msg){
            msg = obj[key]+'不能为空！';
        }
        arr.push(data[key]);
    });
    if(!msg){
        let id = data.id >> 0;
        const connection = await mysql.createConnection(config.mysqlDB);
        array.push('createtime');
        arr.push(new Date().toLocaleString());
        arr[1] = bcrypt.hashSync(data.password, bcrypt.genSaltSync(10));//加密密码
        //先检查是否占用帐号
        const [rows] = await connection.execute('SELECT phone FROM `patient` where `username`=?', [data.username]);
        if(rows.length > 0) {
            msg = '该手机号已经注册了';
        }else{
            const [result] = await connection.execute(`INSERT INTO patient (${array.join(',')}) VALUES (${array.map((()=>'?')).join(',')})`, arr);
            msg = result.affectedRows === 1 ? '' : '添加用户失败';
        }
        await connection.end();
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {}
    }
}


//审核用户
async function passedUser(ctx){
    let data = ctx.request.body;
    let ids = data.ids;
    let msg;
    if(/^\d+(,\d+)*$/.test(ids)){
        const arr = ids.split(',');
        ids = new Array(arr.length).fill("?").join(',');
        const connection = await mysql.createConnection(config.mysqlDB);
        const [result] = await connection.execute(`UPDATE user SET user_type=4 where user_type=0 and id in (${ids})`, arr);
        msg = result.affectedRows > 0 ? '':'审核用户失败！';
        await connection.end();
    }else{
        msg = 'ID参数不合法';
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {passed:4}
    }
}
//删除用户（禁止删除管理员）
async function deleteUser(ctx){
    const data = ctx.request.body;
    let ids = data.ids;
    let msg;
    if(/^\d+(,\d+)*$/.test(ids)){
        const arr = ids.split(',');
        const connection = await mysql.createConnection(config.mysqlDB);
        const [result] = await connection.execute(`DELETE from user where user_type<>1 and user_type<>2 and id in (${arr.map(() => '?').join(',')})`, arr);
        msg = result.affectedRows > 0 ? '':'删除用户失败！';
        await connection.end();
    }else{
        msg = 'ID参数不合法';
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {}
    }
}
//用户上传头像
async function upUserPic(ctx) {
    let pic = ctx.request.body.pic;
    let msg = common.pic_reg.test(pic) ? null : common.pic_txt;
    if(!msg){
        const connection = await mysql.createConnection(config.mysqlDB);
        const [result] = await connection.execute('UPDATE user SET user_pic=? where id=?', [pic,ctx.state.userInfo.id >> 0]);
        msg = result.affectedRows === 1 ? '' : '更新头像失败';
        await connection.end();
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {pic}
    }
}
//保存用户
async function updateUser(ctx) {
    let data = ctx.request.body;
    data.user_type = data.user_type >> 0;
    data.user_type = 1 === data.user_type ? 4 : data.user_type;
    let msg,arr = [];
    const obj = {
        user_name:'用户帐号',
        user_email:'用户邮箱',
        pass_word:'用户密码',
        user_type:'用户类型',
        user_pic:'用户头像'
    };
    const array = Object.getOwnPropertyNames(obj);
    array.forEach(key=>{
        if(data[key]==='' && key !=='user_pic' &&!msg){
            msg = obj[key]+'不能为空！';
        }
        arr.push(data[key]);
    });
    if (!common.name_reg.test(data.user_name)) {
        msg = common.name_txt;
    } else if (!common.pass_reg.test(data.pass_word)) {
        msg = common.pass_txt;
    } else if (!common.email_reg.test(data.user_email)) {
        msg = common.email_txt;
    }
    if(!msg){
        let id = data.id >> 0;
        const connection = await mysql.createConnection(config.mysqlDB);
        if(id){
            array.splice(0,2);//修改时不能修改帐号和邮箱
            arr.splice(0,2);
            if(data.pass_word === common.defaultPassword){
                array.shift();//不修改原密码
                arr.shift();
            }
            arr.push(id);
            const [result] = await connection.execute(`UPDATE user SET ${array.map(k=>k+'=?').join(',')} where id=?`, arr);
            msg = result.affectedRows === 1 ? '' : '修改用户失败';
        }else{
            array.push('create_time');
            arr.push(new Date().toLocaleString());
            arr[2] = bcrypt.hashSync(data.pass_word, bcrypt.genSaltSync(10));//加密密码
            //先检查是否占用帐号
            const [rows] = await connection.execute('SELECT user_name,user_email FROM `user` where `user_name`=? or `user_email`=?', [data.user_name,data.user_email]);
            if(rows.length > 0) {
                msg = rows[0].user_name === data.user_name ? '帐号已经被占用！' : '邮箱已经被占用！';
            }else{
                const [result] = await connection.execute(`INSERT INTO user (${array.join(',')}) VALUES (${array.map((()=>'?')).join(',')})`, arr);
                msg = result.affectedRows === 1 ? '' : '添加用户失败';
            }
        }
        await connection.end();
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {}
    }
}
//获取用户信息
async function getUserById(ctx) {
    let id = ctx.request.body.id >> 0;
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT * FROM user where id=?", [id]);
    const success = list.length === 1;
    await connection.end();
    ctx.body = {
        success,
        message: success ? '' : '查无此用户',
        data: success ? list[0] : {}
    }
}
//用户注册
async function register(ctx) {
    const data = ctx.request.body;
    let msg, success = false;
    if (!common.name_reg.test(data.user_name)) {
        msg = common.name_txt;
    } else if (!common.pass_reg.test(data.pass_word)) {
        msg = common.pass_txt;
    } else if (!common.email_reg.test(data.user_email)) {
        msg = common.email_txt;
    }else{
        //先检查是否占用帐号
        const connection = await mysql.createConnection(config.mysqlDB);
        const [rows] = await connection.execute('SELECT id FROM `user` where `user_name`=?', [data.user_name]);
        if(rows.length > 0){
            console.log(rows)
            msg = '帐号已经被占用！';
        }else{
            const [rows] = await connection.execute('SELECT id FROM `user` where `user_email`=?', [data.user_email]);
            if(rows.length > 0){
                msg = '邮箱已经被占用！';
            }else{
                data.pass_word = bcrypt.hashSync(data.pass_word, bcrypt.genSaltSync(10));
                const result = await connection.execute('INSERT INTO `user` (user_name,pass_word,create_time,login_ip,user_email) VALUES (?,?,?,?,?)', [data.user_name, data.pass_word, new Date().toLocaleString(), getClientIP(ctx),data.user_email]);
                success = result[0].affectedRows === 1;
                msg = success ? '' : '写入数据库失败';
                if(success){
                    //发送激活邮件
                    let link = `${common.web_domain}/api/active/${data.user_name}/${data.pass_word.replace(/\//g,'')}`;
                    let body = `您好：${data.user_name} <br/>欢迎注册【${common.web_name}】网站，请点击<a href="${link}" target="_blank">${link}</a>链接进行激活您的帐号！<p><img src="http://www.scscms.com/images/whiteSCS.png" /></p>`;
                    if(await sendEmail(data.user_email, common.web_name+'【帐号激活】', body)){
                        return ctx.body = {
                            success: true,
                            data:{emailErr:true},
                            message: ''
                        }
                    }
                }
            }
        }
        await connection.end();
    }
    ctx.body = {
        success: success,
        data:{},
        message: msg
    }
}
//用户激活
async function active(ctx) {
    const data = ctx.params;
    let code = 'succeed';
    if(data.name && data.code){
        const connection = await mysql.createConnection(config.mysqlDB);
        const [rows] = await connection.execute('SELECT id,pass_word FROM `user` where `user_name`=? and `user_type`=?', [data.name,0]);
        if (rows.length) {
            if(rows[0].pass_word.replace(/\//g,'') !== data.code){
                code = 'errCode';
            }else{
                const [list] = await connection.execute('UPDATE `user` SET `user_type`=? where `id`=?', [4,rows[0].id]);
                code = list.affectedRows === 1 ? 'success' :'failed';
            }
        }else{
            code = 'nobody';
        }
        await connection.end();
    }else{
        code = 'lack';
    }
    ctx.redirect(common.web_domain + '/Login?active=' + code);
}

//用户登录
async function login(ctx) {
    const data = ctx.request.body;
    let msg;
    if (!common.name_reg.test(data.user_name)) {
        msg = common.name_txt;
    } else if (!common.pass_reg.test(data.pass_word)) {
        msg = common.pass_txt;
    } else {
        //初步验证通过，开始查询数据库
        const connection = await mysql.createConnection(config.mysqlDB);
        const [rows] = await connection.execute('SELECT * FROM `user` where `user_name`=?', [data.user_name]);
        msg = '用户名或密码错误！';//不应该具体透露是密码还是帐户出错！
        if (rows.length) {
            const userInfo = rows[0];
            if (bcrypt.compareSync(data.pass_word, userInfo.pass_word)) {
                if (userInfo.user_type === 0) {
                    msg = '此帐号正在审核中！';
                }else{
                    let ip = config.getClientIP(ctx);
                    await connection.execute('UPDATE `user` SET `login_ip`=? where `id`=?', [ip, userInfo.id]);
                    delete userInfo.pass_word;
                    return ctx.body = {
                        success: true,
                        data: {
                            userInfo,
                            token: jwt.sign(Object.assign({ip}, userInfo),
                                config.JWTs.secret, {expiresIn: config.JWTs.expiresIn})
                        }
                    }
                }
            }
        }
        await connection.end();
    }
    ctx.body = {
        success: false,
        message: msg,
        data: {}
    };
}

//找回密码
async function retrieve(ctx) {
    const data = ctx.request.body;
    let err;
    const obj = {
        user_email:'邮箱',
        pass_word:'新密码',
        pass_words:'确认密码'
    };
    for (let key in obj) {
        if (!common[key === 'user_email' ? 'email_reg' : 'pass_reg'].test(data[key])) {
            err = obj[key] + '格式不正确！';
            break;
        }
    }
    if (!err && data.pass_word !== data.pass_words) {
        err = '新密码与确认密码不相同！';
    }
    if(!err){
        const connection = await mysql.createConnection(config.mysqlDB);
        const [rows] = await connection.execute('SELECT `user_name`,`user_extend` FROM `user` where `user_email`=?', [data.user_email]);
        if(rows.length){
            let extend = {};
            try{
                extend = JSON.parse(rows[0].user_extend||'{}');
            }catch(e){}
            extend.password = bcrypt.hashSync(data.pass_word, bcrypt.genSaltSync(10));//加密新密码
            const [result] = await connection.execute('UPDATE `user` set `user_extend`=? where `user_email`=?', [JSON.stringify(extend), data.user_email]);
            if(result.affectedRows === 1){
                //发激活邮件
                let link = `${common.web_domain}/api/findPassword/${data.user_email}/${extend.password.replace(/\//g,'')}`;
                let body = `您好：${rows[0].user_name} <br/>欢迎使用【${common.web_name}】网站密码找回功能，请点击<a href="${link}" target="_blank">${link}</a>链接进行重设您的新密码为：【${data.pass_word}】！<p><img src="http://www.scscms.com/images/whiteSCS.png" /></p>`;
                if(await sendEmail(data.user_email, common.web_name+'【密码找回】', body)){
                    await connection.end();
                    return ctx.body = {
                        success: true,
                        data:{findErr:true},
                        message: ''
                    }
                }
            }else{
                err = '找回密码失败！';
            }
        }else{
            err = '邮箱不正确！';
        }
        await connection.end();
    }
    ctx.body = {
        success: !err,
        message: err,
        data: {}
    }
}

//激活找回密码
async function findPassword(ctx) {
    const data = ctx.params;
    let code = 'succeed';
    if(data.email && data.code){
        const connection = await mysql.createConnection(config.mysqlDB);
        const [rows] = await connection.execute('SELECT `user_extend` FROM `user` where `user_email`=?', [data.email]);
        if (rows.length) {
            let extend = {};
            try{
                extend = JSON.parse(rows[0].user_extend);
            }catch(e){}
            if(extend.password && extend.password.replace(/\//g,'') === data.code){
                let password = extend.password;
                delete extend.password;
                const [list] = await connection.execute('UPDATE `user` SET `pass_word`=?,`user_extend`=? where `user_email`=?', [password,JSON.stringify(extend),data.email]);
                code = list.affectedRows === 1 ? 'success' :'failed';
            }else{
                code = 'errCode';
            }
        }else{
            code = 'nobody';
        }
        await connection.end();
    }else{
        code = 'lack';
    }
    ctx.redirect(common.web_domain + '/Login?find=' + code);
}

//修改密码
async function changePassword(ctx) {
    const data = ctx.request.body;
    let err;
    const obj = {
        old_password:'旧密码',
        pass_word:'新密码',
        pass_words:'确认密码'
    };
    for(let key in obj){
        if (!common.pass_reg.test(data[key])) {
            err = obj[key]+'格式不正确！';
            break;
        }
    }
    if (!err && data.old_password === data.pass_words) {
        err = '旧密码不能与新密码相同！';
    } else if (!err && data.pass_word !== data.pass_words) {
        err = '新密码与确认密码不相同！';
    }
    if(!err){
        const user = ctx.state.userInfo;//获取用户信息
        const connection = await mysql.createConnection(config.mysqlDB);
        const [rows] = await connection.execute('SELECT `pass_word` FROM `user` where `id`=?', [user.id]);
        if(rows.length && bcrypt.compareSync(data.old_password,rows[0].pass_word)){
            const password = bcrypt.hashSync(data.pass_word, bcrypt.genSaltSync(10));//加密新密码
            const result = await connection.execute('update `user` set `pass_word`=? where `id`=?', [password, user.id]);
            err = result.affectedRows === 0 ? '修改密码失败！':'';
        }else{
            err = '旧密码不正确！';
        }
        await connection.end();
    }
    ctx.body = {
        success: !err,
        message: err,
        data: {}
    }
}

//新添或编辑文章
async function updateArticle(ctx) {
    const data = ctx.request.body;
    let err;
    const obj = {
        title:'文章标题',
        description:'文章概要',
        read_type:'阅读权限',
        content:'文章内容'
    };
    for(let key in obj){
        if (!data[key]) {
            err = obj[key]+'不能为空！';
            break;
        }
    }
    const array = [
        data.title.slice(0,100),
        data.description.slice(0,255),
        data.read_type >> 0,
        data.sort_id >> 0,
        data.content,
        data.article_extend
    ];
    if(!err){
        const user = ctx.state.userInfo;//获取用户信息
        const connection = await mysql.createConnection(config.mysqlDB);
        if(data.id > 0){
            //编辑文章
            if(user.user_type > 2){
                //非管理员需要验证是否为自己的文章(同时普通管理员也可修改超管文章)
                const [rows] = await connection.execute('SELECT `id` FROM `article` where `id`=? and `user_id`=?', [data.id,user.id]);
                if(!rows.length){
                    return ctx.body = {
                        success: false,
                        message: '无权编辑此文章',
                        data: {}
                    }
                }
            }
            array.push(data.id);
            const [result] = await connection.execute('UPDATE `article` SET `title`=?,`description`=?,`read_type`=?,`sort_id`=?,`content`=?,`article_extend`=? where `id`=?', array);
            err = result.affectedRows === 1 ? '' :'文章修改失败';
        }else{
            //添加文章
            array.push(new Date().toLocaleString());//添加日期
            array.push(user.user_type > 4 ? 1 : 0);//是否通过审核
            array.push(user.id);//用户信息
            const [result] = await connection.execute('INSERT INTO `article` (title,description,read_type,sort_id,content,article_extend,create_time,passed,user_id) VALUES (?,?,?,?,?,?,?,?,?)', array);
            err = result.affectedRows === 1 ? '' :'文章添加失败';
        }
        await connection.end();
    }
    ctx.body = {
        success: !err,
        message: err,
        data: {}
    }
}

//文章列表
async function listArticle(ctx) {
    const data = ctx.request.body;
    let pageSize = Math.abs(data.pageSize >> 0)||10;//分页率
    let page = Math.abs(data.page >> 0)||1;//当前页码
    const arr = [];
    let querying = '';
    if(data.title){
        querying += " and title like ?";
        arr.push('%' + data.title + '%');
    }
    if(/^\d+$/.test(data.sort_id)){
        querying += ' and sort_id=?';
        arr.push(data.sort_id >> 0);
    }
    if(/^[1-4]$/.test(data.read_type)){
        querying += " and read_type=?";
        arr.push(data.read_type >> 0);
    }
    //会员只能查看自己的文章(暂关闭)
    const user = ctx.state.userInfo;
    if(user.user_type > 2){
        //querying += " and user_id=?";
        //arr.push(user.id >> 0);
    }
    const connection = await mysql.createConnection(config.mysqlDB);
    const [rows] = await connection.execute("SELECT SQL_NO_CACHE COUNT(*) as total FROM `article`"+querying.replace('and','where'), arr);
    const total = rows[0].total;//总数量
    const pages = Math.ceil(total/pageSize);
    if(page > pages){
        page = Math.max(1,pages);//以防没数据
    }
    querying += " LIMIT ?, ?";
    arr.push((page - 1) * pageSize,pageSize);
    const [list] = await connection.execute("SELECT a.id,a.title,a.sort_id,a.user_id,a.passed,a.read_type,a.create_time,u.`user_name`,s.`sort_name` FROM article as a LEFT JOIN user as u on a.user_id = u.id LEFT JOIN sort as s on a.sort_id = s.id"+querying.replace('and','where'), arr);
    await connection.end();
    ctx.body = {
        success: true,
        message: '',
        data: {
            page,total,data:list
        }
    }
}

//获取文章详情（管理员获取所有；会员获取自己的或者是审核通过的）
async function getArticleById(ctx) {
    const data = ctx.request.body;
    let id = data.id >> 0;
    let msg;
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute("SELECT a.*,u.`user_name`,s.`sort_name` FROM article as a LEFT JOIN user as u on a.user_id = u.id LEFT JOIN sort as s on a.sort_id = s.id where a.id=?", [id]);
    const obj = list[0];
    if(list.length === 1){
        const user = ctx.state.userInfo;
        if(user.user_type > 2 && user.id !== obj.user_id && obj.passed === 0){
            msg = '文章仍在审核中';
        }
    }else{
        msg = '查无此文章';
    }
    await connection.end();
    ctx.body = {
        success: !msg,
        message: msg,
        data: !msg ? obj : {}
    }
}

//审核文章
async function passedArticle(ctx) {
    const data = ctx.request.body;
    const passed = data.passed === '1' ? 1 : 0;
    let ids = data.ids;
    let msg;
    if(/^\d+(,\d+)*$/.test(ids)){
        const arr = ids.split(',');
        ids = new Array(arr.length).fill("?").join(',');
        arr.unshift(passed);
        const connection = await mysql.createConnection(config.mysqlDB);
        const [result] = await connection.execute(`UPDATE article SET passed=? where id in (${ids})`, arr);
        msg = result.affectedRows > 0 ? '':'审核文章失败！';
        await connection.end();
    }else{
        msg = 'ID参数不合法';
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {passed}
    }
}

//管理员删除文件或会员删除自己的
async function deleteArticle(ctx){
    const data = ctx.request.body;
    let ids = data.ids;
    let msg;
    if(/^\d+(,\d+)*$/.test(ids)){
        const arr = ids.split(',');
        let sql = `DELETE from article where id in (${arr.map(() => '?').join(',')})`;
        const user = ctx.state.userInfo;
        if(user.user_type > 2){
            sql += " and user_id=?";//会员只能删除自己的
            arr.push(user.id >> 0);
        }
        const connection = await mysql.createConnection(config.mysqlDB);
        const [result] = await connection.execute(sql, arr);
        msg = result.affectedRows > 0 ? '':'删除文章失败！';
        await connection.end();
    }else{
        msg = 'ID参数不合法';
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {}
    }
}

//新添或编辑分类
async function updateSort(ctx) {
    const data = ctx.request.body;
    data.id = data.id >> 0;
    data.sort_name = data.sort_name.slice(0,50);
    data.sort_type = data.sort_type.slice(0,10);
    data.parent_id = data.parent_id >> 0;
    let err;
    const obj = {
        sort_name:'分类名称',
        sort_type:'分类类别',
    };
    for(let key in obj){
        if (!data[key]) {
            err = obj[key]+'不能为空！';
            break;
        }
    }
    const array = [data.sort_name,data.sort_type,data.parent_id];
    if(!err){
        const connection = await mysql.createConnection(config.mysqlDB);
        if(data.id > 0){
            array.push(data.id);
            const [result] = await connection.execute('UPDATE `sort` SET `sort_name`=?,`sort_type`=?,`parent_id`=? where `id`=?', array);
            err = result.affectedRows === 1 ? '' :'分类修改失败';
        }else{
            const [result] = await connection.execute('INSERT INTO `sort` (sort_name,sort_type,parent_id) VALUES (?,?,?)', array);
            err = result.affectedRows === 1 ? '' :'分类添加失败';
            data.id = result.insertId;//插入数据库的ID
        }
        await connection.end();
    }
    ctx.body = {
        success: !err,
        message: err,
        data: {
            data
        }
    }
}

//分类列表
async function listSort(ctx) {
    const data = ctx.request.body;
    let sql = 'SELECT s.*,a.counts from `sort` as s LEFT JOIN (SELECT sort_id,count(*) as counts FROM `article` GROUP BY sort_id) as a on a.sort_id = s.id';
    let arr = [];
    if(data.type){
        sql += ' where s.sort_type = ?';
        arr.push(data.type);
    }
    const connection = await mysql.createConnection(config.mysqlDB);
    const [list] = await connection.execute(sql,arr);
    await connection.end();
    ctx.body = {
        success: true,
        message: '',
        data: {
            data:list
        }
    }
}

//删除分类
async function deleteSort(ctx) {
    const data = ctx.request.body;
    let id = data.id >> 0;
    const connection = await mysql.createConnection(config.mysqlDB);
    const [result] = await connection.execute('DELETE from `sort` where id=?',[id]);
    await connection.end();
    ctx.body = {
        success: result.affectedRows === 1,
        message: result.affectedRows === 1 ? '' : `id:${id}分类删除失败！`,
        data: {}
    }
}
//批量删除分类
async function batchDelSort(ctx) {
    const data = ctx.request.body;
    let result = {};
    if(/^\d+(,\d+)*$/.test(data.ids)){
        const connection = await mysql.createConnection(config.mysqlDB);
        const [list] = await connection.execute('DELETE from `sort` where id in(?)',[data.ids]);
        result = list;
        await connection.end();
    }
    ctx.body = {
        success: result.affectedRows === 1,
        message: result.affectedRows === 1 ? '' : `ids:${data.ids}分类删除失败！`,
        data: {}
    }
}
//保存上传记录
async function saveUpFile(arr) {
    const connection = await mysql.createConnection(config.mysqlDB);
    const [result] = await connection.execute('INSERT INTO `upload` (user_id,file_name,file_path,mime_type,file_size,is_delete,create_time) VALUES (?,?,?,?,?,?,?)', arr);
    await connection.end();
    return result;
}
//上传文件列表
async function listUpFile(ctx) {
    const data = ctx.request.body;
    let pageSize = Math.abs(data.pageSize >> 0)||10;
    let page = Math.abs(data.page >> 0)||1;//当前页码
    const connection = await mysql.createConnection(config.mysqlDB);
    const [rows] = await connection.execute('SELECT SQL_NO_CACHE COUNT(*) as total FROM `upload`', []);
    const total = rows[0].total;//总数量
    const pages = Math.ceil(total/pageSize);
    if(page > pages){
        page = Math.max(1,pages);//以防没数据
    }
    console.log((page - 1) * pageSize,page * pageSize);
    const [list] = await connection.execute('SELECT a.*,u.`user_name` FROM upload as a LEFT JOIN user as u on a.user_id = u.id LIMIT ?, ?', [(page - 1) * pageSize,pageSize]);
    await connection.end();
    list.forEach(obj=>{
        obj.full_path = common.web_domain + obj.file_path.replace(/\\/g,'/').replace('dist/','/');
    });
    ctx.body = {
        success: true,
        message: '',
        data: {
            page,total,data:list
        }
    }
}
//删除上传文件列表
async function delFile(ctx) {
    const data = ctx.request.body;
    let ids = data.id;
    let arr = ids.split(',');
    let msg;
    if(/^\d+(,\d+)*$/.test(ids)){
        ids = arr.map(() => '?').join(',');
        const connection = await mysql.createConnection(config.mysqlDB);
        const [rows] = await connection.execute(`SELECT file_path FROM upload where id in (${ids})`, arr);
        if(rows.length){
            for(let i = rows.length;i--;){
                const path = rows[i].file_path.replace(/\\/g,'/');
                if(path.startsWith(config.upPath)){
                    try{
                        fs.unlinkSync(path);
                    }catch(e){}
                }
            }
            if(data.delRecord === 'true'){
                await connection.execute(`DELETE from upload where id in (${ids})`, arr);
            }
        }else{
            msg = '无此记录';
        }
        await connection.end();
    }else{
        msg = 'ID参数不合法';
    }
    ctx.body = {
        success: !msg,
        message: msg,
        data: {}
    }
}

export default {
    listDepartment,
    updateDepartment,
    deleteDepartment,
    batchDelDepartment,
    listMedicineType,
    updateMedicineType,
    deleteMedicineType,
    batchDelMedicineType,
    listHospital,
    updateHospital,
    deleteHospital,
    batchDelHospital,
    listSickness,
    updateSickness,
    deleteSickness,
    batchDelSickness,
    listMedicine,
    updateMedicine,
    deleteMedicine,
    batchDelMedicine,
    saveUpFile,
    listUpFile,
    delFile,
    login,
    register,
    retrieve,
    findPassword,
    active,
    listArticle,
    changePassword,
    updateArticle,
    passedArticle,
    deleteArticle,
    getArticleById,
    updateSort,
    listSort,
    deleteSort,
    batchDelSort,
    listUser,
    listDoctor,
    updateDoctor,
    deleteDoctor,
    getDoctorById,
    listPatient,
    passedUser,
    deleteUser,
    getUserById,
    upUserPic,
    updateUser
}
