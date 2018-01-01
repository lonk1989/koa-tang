<template>
    <div>
        <el-form :model="form" :rules="rules" label-width="80px" ref="form">
            <el-form-item label="客服电话" prop="tel">
                <el-input v-model="form.tel"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="visible = false">取 消</el-button>
            <el-button type="primary" :disabled="loading" @click="save">保 存</el-button>
        </div>
    </div>
</template>
<script type="text/javascript">
    import {ajax,storage} from 'utils';
    import common from 'common';
    module.exports = {
        name: 'Department',
        data() {
            return {
                loading: false,
                filterText: '',
                parent_data: null,
                form: {
                    id: 0,
                    tel: ''
                },
                rules: {
                    tel: {required: true, trigger: 'change'}
                },
                data: []
            }
        },
        mounted(){
            ajax.call(this, '/settings', {}, (data, err) => {
                if (!err) {
                    this.form = data;
                }
            })
        },
        methods: {
            save(){
                this.$refs.form.validate(v => {
                    if (v) {
                        this.loading = true;
                        ajax.call(this, '/updateSettings', this.form, (data, err) => {
                            this.loading = false;
                            if (!err) {
                                let json = data.data, msg;
                                msg = '修改成功！'
                                this.$message({
                                    message: msg,
                                    type: 'success'
                                });
                            }
                        })
                    }
                });
            }
        },
        mixins:[common.mixin],
    }
</script>
<style lang="less">
    .filter-tree {
        margin-top: 10px;
        border-radius: 5px;
        .el-cascader{width:100%}
        .el-tree-node__content>.el-checkbox{
            height:40px;
        }
        .el-tree-node__content {
            border-bottom: 1px dashed #ddd;
            white-space: normal;
        }
    }
    .button-tree {
        text-align: right;
        button {
            margin-left: 10px
        }
    }
</style>
