//后台配置文件
export default {
    //数据库配置
    mysqlDB : {
		host:'118.31.12.161',
        // host: 'localhost',
        user: 'root',
        password:'123456',
        database: 'tang'
    },
    upPath:'dist/upFile/',//上传路径
    //token 配置
    JWTs : {
        secret : 'scscms', // 指定密钥
        expiresIn:'2h'  //超时设置 m分钟 h小时 d天数
    },
    //邮件服务配置
    emailServer:{
        service: 'SMTP',
        host: 'smtp.126.com',
        port: 465,
        auth: {
            user: '-',
            pass: '-'
        }
    },
    //公用：获取客户端IP
    getClientIP:function(ctx) {
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
}
