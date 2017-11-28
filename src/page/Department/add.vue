<template>
    <div class="add-article">
        <el-form ref="form" :model="data" :rules="rules" label-width="80px">
            <el-form-item label="科室名称" prop="name">
                <el-input v-model="data.name"></el-input>
            </el-form-item>
            <el-form-item label="排序" prop="order">
                <el-input v-model="data.order"></el-input>
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
                sort_id:[],
                sort_data:[],
                data: {
                    id:0,
                    name: '',
                    order:0
                },
                rules: {
                    name:{required: true, message: '科室名称不能为空'}
                }
            }
        },
        methods: {
            save(){
                this.$refs.form.validate(v => {
                    if (v) {
                        this.visible = true;
                        ajax.call(this, '/updateDepartment', this.data, (data, err) => {
                            this.loading = false;
                            if (!err) {
                                this.$message({
                                    message: '保存成功',
                                    type: 'success'
                                });
                                this.$router.push('/department/list');
                            }
                        })
                    }
                });
            },
            backList(){
                this.$router.push('/department/list');
            }
        },
        mounted() {
            storage.get('userInfo',obj=>{
                this.data.user_name = obj.userInfo.user_name;
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
