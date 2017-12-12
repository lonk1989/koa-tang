<template>
    <div class="add-article">
        <el-form ref="form" :model="data" :rules="rules" label-width="80px">
            <el-form-item label="医生姓名" prop="name">
                <el-input v-model="data.name"></el-input>
            </el-form-item>
            <el-form-item label="医生所属医院" prop="hospital_id">
                <el-select v-model="data.hospital_id" ref="select"
                           style="width: 100%">
                    <el-option v-for="(item,key) in hospital_data" :key="key" :label="item" :value="key">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="医生手机号" prop="phone">
                <el-input v-model="data.phone"></el-input>
            </el-form-item>
            <el-form-item label="医生性别" prop="sex">
                <el-slider v-model="data.sex" :format-tooltip="formatTooltipSex" :min="0" :max="1"></el-slider>
            </el-form-item>
            <el-form-item label="医师职称" prop="read_type">
                <el-slider v-model="data.rank" :format-tooltip="formatTooltip" :min="0" :max="5"></el-slider>
            </el-form-item>
            <el-form-item label="排序" prop="sort">
                <el-input v-model="data.sort"></el-input>
            </el-form-item>
            <el-form-item label="头像" prop="avatar">
                <el-input v-model="data.avatar"></el-input> <up-file ref="uploadAvatar" :upload="{}" @successUpload="successUploadAvatar"></up-file> <el-button @click="upImgAvatar">上传头像</el-button>
            </el-form-item>
            <el-form-item label="问诊价格" prop="price">
                <el-input v-model="data.price"></el-input>
            </el-form-item>
            <el-form-item label="复诊价格" prop="consult_price">
                <el-input v-model="data.consult_price"></el-input>
            </el-form-item>
            <el-form-item label="医生公告" prop="notice">
                <el-input type="textarea" v-model="data.notice"></el-input>
            </el-form-item>
            <el-form-item label="擅长(用英文逗号分割，例：皮肤科,脱发,湿疹)" prop="adept">
                <el-input type="textarea" v-model="data.adept"></el-input>
            </el-form-item>
            <el-form-item label="插入图片" prop="aboutPic">
                <el-input v-model="data.aboutPic"></el-input> <up-file ref="uploadAbout" :upload="{}" @successUpload="successUploadAbout"></up-file> <el-button @click="upImgAbout">插入图片</el-button>
            </el-form-item>
            <el-form-item label="关于我" prop="about">
                <VueEditor :content="data.about" :height="250" :auto-height="false" @change="changeAbout"></VueEditor>
            </el-form-item>
            <el-form-item label="插入图片" prop="aboutPic">
                <el-input v-model="data.introPic"></el-input> <up-file ref="uploadIntro" :upload="{}" @successUpload="successUploadIntro"></up-file> <el-button @click="upImgIntro">插入图片</el-button>
            </el-form-item>
            <el-form-item label="我的简介" prop="intro">
                <VueEditor :content="data.intro" :height="250" :auto-height="false" @change="changeIntro"></VueEditor>
            </el-form-item>
            <el-form-item style="text-align: right">
                <el-button @click="backList">返回列表</el-button>
                <el-button type="primary" :disabled="loading" @click="save">保存</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script type="text/javascript">
    import {ajax,storage} from 'utils';
    import common from 'common';
    import components from 'components';
    module.exports = {
        name: 'list',
        data() {
            return {
                page_grade:common.page_grade,
                grade:{
                    updateArticle: !0,
                    upFile: !0
                },
                userInfo:{},
                read_type: common.user_type,
                loading:false,
                hospital_id:[],
                hospital_data:[],
                data: {
                    id:0,
                    name: '',
                    sex: 0,
                    phone: '',
                    hospital_id:'',
                    price:'',
                    consult_price:'',
                    avatar: '',
                    rank:0,
                    notice:'',
                    adept:'',
                    about:'',
                    intro: '',
                    sort:0
                },
                rules: {
                    sort_id:{required: true, message: '分类不能为空'},
                    name:[{
                        required: true, message: '姓名不能为空', trigger: 'change'
                    }],
                    phone:[{
                        required: true, message: '手机号不能为空', trigger: 'change'
                    }]
                },
                defaultProps: {
                    children: 'children',
                    label: 'hospital_name',
                    value: 'id'
                }
            }
        },
        methods: {
            save(){
                this.$refs.form.validate(v => {
                    if (v) {
                        this.visible = true;
                        this.data.article_extend = JSON.stringify({avatar:this.data.avatar});
                        ajax.call(this, '/updateDoctor', this.data, (data, err) => {
                            this.loading = false;
                            if (!err) {
                                this.$message({
                                    message: '保存成功',
                                    type: 'success'
                                });
                                this.$router.push('/doctor/list');
                            }
                        })
                    }
                });
            },
            formatTooltipSex(v){
                return common.sex[v];
            },
            formatTooltip(v){
                return common.rank[v];
            },
            changeAbout(v){
                this.data.about = v;
            },
            changeIntro(v){
                this.data.intro = v;
            },
            upImgAvatar(){
                this.$refs.uploadAvatar.SelectFile();
            },
            upImgAbout(){
                this.$refs.uploadAbout.SelectFile();
            },
            upImgIntro(){
                this.$refs.uploadIntro.SelectFile();
            },
            backList(){
                this.$router.push('/article/list');
            },
            successUploadAvatar(data){
                this.data.avatar = data.filename;
            },
            successUploadAbout(data){
                this.data.about += '<img src="'+data.filename+'" />';
            },
            successUploadIntro(data){
                this.data.intro += '<img src="'+data.filename+'" />';
            }
        },
        mounted() {
            storage.get('userInfo',obj=>{
                this.data.user_name = obj.userInfo.user_name;
            });
            ajax.call(this, '/listHospital', {}, (data, err) => {
                if (!err) {
                    let arr = data.data;
                    let obj = {}
                    arr.map((o,i) => {
                        obj[o.id.toString()] = o.name
                    })
                    this.hospital_data = obj;
                    let id = this.$route.params.id;
                    if(id){
                        ajax.call(this, '/getDoctorById', {id}, (obj, err) => {
                            if (!err) {
                                Object.getOwnPropertyNames(this.data).forEach(key => {
                                    this.data[key] = obj[key];
                                });
                            }
                        })
                    }
                }
            })
        },
        mixins:[common.mixin],
        components
    }
</script>
<style lang="less">
    .add-article {
        .el-input,.el-textarea__inner,.el-slider {
            max-width:60%
        }
        .el-cascader{
            width:100%;
            max-width:60%;
            .el-input{
                width:100%
            }
        }
    }
</style>
