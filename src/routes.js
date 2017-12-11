import common from 'common'
import Login from 'page/Login.vue'
import NoFind from 'page/NoFind.vue'
import Home from 'page/Home.vue'
import ArticleList from 'page/Article/list.vue'
import ArticleSort from 'page/Article/sort.vue'
import ArticleAdd from 'page/Article/add.vue'
import Department from 'page/BaseInfo/department.vue'
import Hospital from 'page/BaseInfo/hospital.vue'
import Sickness from 'page/BaseInfo/sickness.vue'
import Medicine from 'page/BaseInfo/medicine.vue'
import MedicineType from 'page/BaseInfo/medicine-type.vue'
import UpFileList from 'page/UpFile/list.vue'
import userList from 'page/User/list.vue'
import userAdd from 'page/User/add.vue'
import doctorList from 'page/Doctor/list.vue'
import doctorAdd from 'page/Doctor/add.vue'
import patientList from 'page/Patient/list.vue'
import patientAdd from 'page/Patient/add.vue'
//todo 记录
/*
*
* */
export default {
    mode: 'history',
    base: __dirname,
    routes: [
        {
            path: '*',
            name:'/404',
            component: NoFind
        },{
            path: '/',
            redirect: '/login'
        },{
            path: '/login',
            name:'login',
            meta:{title:'登录'},
            component: Login
        },{
            path: '/article',
            meta:{
                verify:true,
                title:'文章管理',
                icon:'fa fa-file-text-o'
            },
            component: Home,
            redirect:'/article/list',
            children: [{
                path: 'sort',
                meta:{
                    verify:true,
                    grade:common.page_grade.listSort,
                    title: '分类管理',
                    icon:'fa fa-th-large'
                },
                component: ArticleSort
            },{
                path: 'list',
                meta:{
                    verify:true,
                    grade:common.page_grade.listArticle,
                    title: '文章列表',
                    icon:'fa fa-newspaper-o'
                },
                component: ArticleList
            },{
                path: 'add',
                meta:{
                    verify:true,
                    title: '添加文章',
                    icon:'fa fa-clone'
                },
                component: ArticleAdd
            },{
                path: 'edit/:id',
                meta:{
                    verify:true,
                    title: '编辑文章',
                    icon:'fa fa-clone'
                },
                component: ArticleAdd
            }]
        },{
            path: '/base-info',
            meta:{
                verify:true,
                title:'基础信息',
                icon:'fa fa-file-text-o'
            },
            component: Home,
            redirect:'/base-info/department',
            children: [{
                path: 'department',
                meta:{
                    verify:true,
                    grade:4,
                    title:'科室列表',
                    icon:'fa fa-clone'
                },
                component: Department
            },{
                path: 'hospital',
                meta:{
                    verify:true,
                    title: '医院列表',
                    icon:'fa fa-clone'
                },
                component: Hospital
            },{
                path: 'sickness',
                meta:{
                    verify:true,
                    title: '不适症状',
                    icon:'fa fa-clone'
                },
                component: Sickness
            },{
                path: 'medicine',
                meta:{
                    verify:true,
                    title: '药品列表',
                    icon:'fa fa-clone'
                },
                component: Medicine
            },{
                path: 'medicine-type',
                meta:{
                    verify:true,
                    title:'药品分类',
                    icon:'fa fa-clone'
                },
                component: MedicineType
            }]
        },{
            path: '/user',
            meta:{
                verify:true,
                title:'用户管理',
                icon:'fa fa-user-o'
            },
            redirect:'/user/list',
            component: Home,
            children: [{
                path: 'list',
                meta:{
                    verify:true,
                    grade:common.page_grade.userList,
                    title: '用户列表',
                    icon:'fa fa-address-card-o'
                },
                component: userList
            },{
                path: 'add',
                meta:{
                    verify:true,
                    grade:common.page_grade.updateUser,
                    title: '添加用户',
                    icon:'fa fa-user-plus'
                },
                component: userAdd
            },{
                path: 'edit/:id',
                meta:{
                    verify:true,
                    title: '编辑用户',
                    icon:'fa fa-user-times'
                },
                component: userAdd
            }]
        },{
            path: '/doctor',
            meta:{
                verify:true,
                title:'医生管理',
                icon:'fa fa-user-o'
            },
            redirect:'/doctor/list',
            component: Home,
            children: [{
                path: 'list',
                meta:{
                    verify:true,
                    grade:4,
                    title: '医生列表',
                    icon:'fa fa-address-card-o'
                },
                component: doctorList
            },{
                path: 'add',
                meta:{
                    verify:true,
                    grade:4,
                    title: '添加医生',
                    icon:'fa fa-user-plus'
                },
                component: doctorAdd
            },{
                path: 'edit/:id',
                meta:{
                    verify:true,
                    title: '编辑医生',
                    icon:'fa fa-user-times'
                },
                component: doctorAdd
            }]
        },{
            path: '/patient',
            meta:{
                verify:true,
                title:'患者管理',
                icon:'fa fa-user-o'
            },
            redirect:'/patient/list',
            component: Home,
            children: [{
                path: 'list',
                meta:{
                    verify:true,
                    grade:4,
                    title: '患者列表',
                    icon:'fa fa-address-card-o'
                },
                component: patientList
            },{
                path: 'add',
                meta:{
                    verify:true,
                    grade:4,
                    title: '添加患者',
                    icon:'fa fa-user-plus'
                },
                component: patientAdd
            },{
                path: 'edit/:id',
                meta:{
                    verify:true,
                    title: '编辑患者',
                    icon:'fa fa-user-times'
                },
                component: patientAdd
            }]
        },{
            path: '/upfile',
            meta:{
                verify:true,
                title:'上传管理',
                icon:'fa fa-upload'
            },
            component: Home,
            redirect:'/upfile/list',
            children: [{
                path: 'list',
                meta:{
                    verify:true,
                    grade:common.page_grade.listUpFile,
                    title: '上传列表',
                    icon:'fa fa-files-o'
                },
                component: UpFileList
            }]
        }
    ]
}
