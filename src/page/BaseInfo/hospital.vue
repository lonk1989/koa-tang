<template>
    <div>
        <el-row :gutter="20">
            <el-col :span="8">
                <el-input placeholder="输入关键字进行过滤" v-model="filterText"></el-input>
            </el-col>
            <el-col :span="16" class="button-tree">
                <el-button type="success" @click="add">新增</el-button>
                <el-button type="danger" @click="batchDelete">批量删除</el-button>
            </el-col>
        </el-row>
        <el-tree
            class="filter-tree"
            :data="data"
            node-key="id"
            :props="defaultProps"
            default-expand-all
            :show-checkbox="true"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            :render-content="renderContent"
            ref="tree">
        </el-tree>
        <el-dialog :title="getTitle" :visible.sync="visible" size="tiny">
            <el-form :model="form" :rules="rules" label-width="80px" ref="form">
                <el-form-item label="名称" prop="name">
                    <el-input v-model="form.name"></el-input>
                </el-form-item>
                <el-form-item label="医院等级(例：三甲医院)" prop="rank">
                    <el-input v-model="form.rank"></el-input>
                </el-form-item>
                <el-form-item label="排序" prop="sort">
                    <el-input v-model="form.sort" type="number"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="visible = false">取 消</el-button>
                <el-button type="primary" :disabled="loading" @click="save">保 存</el-button>
            </div>
        </el-dialog>
    </div>
</template>
<script type="text/javascript">
    import {ajax,storage} from 'utils';
    import common from 'common';
    module.exports = {
        name: 'Hospital',
        data() {
            return {
                page_grade:common.page_grade,
                grade:{
                },
                type: 'edit',
                visible: false,
                loading: false,
                filterText: '',
                parent_data: null,
                form: {
                    id: 0,
                    name: '',
                    rank: '',
                    sort: 0,
                },
                rules: {
                    name: {required: true, trigger: 'change'}
                },
                data: [],
                defaultProps: {
                    disabled: 'disabled',
                    label: 'name',
                    value: 'id'
                }
            }
        },
        computed: {
            getTitle(){
                return this.type === 'edit' ? '编辑' : '添加';
            }
        },
        mounted(){
            ajax.call(this, '/listHospital', {}, (data, err) => {
                if (!err) {
                    this.data = data.data;
                }
            })
        },
        watch: {
            filterText(val) {
                this.$refs.tree.filter(val);
            }
        },
        methods: {
            batchDelete(){
                let v = this.$refs.tree.getCheckedKeys();
                if(v.length){
                    this.$confirm('确定要删除吗！', '系统提醒', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        ajax.call(this, '/batchDelHospital', {ids:v.join(',')}, (d, err) => {
                            if (!err) {
                                let a = (obj)=>{
                                    let c = 0
                                    for(let i = 0; i < obj.length; i++) {
                                        v.includes(obj[i].id)&&obj.splice(i--,1);
                                    }
                                };
                                a(this.data);
                                this.$refs.tree.setCheckedKeys([]);
                            }
                        })
                    }).catch(() => {});
                }else{
                    this.$message('请先选择数据！');
                }
            },
            save(){
                this.$refs.form.validate(v => {
                    if (v) {
                        this.visible = true;
                        this.loading = true;
                        ajax.call(this, '/updateHospital', this.form, (data, err) => {
                            this.visible = false;
                            this.loading = false;
                            if (!err) {
                                let json = data.data, msg;
                                if (this.type === 'edit') {
                                    Object.assign(this.parent_data, json);
                                    msg = '修改成功！'
                                } else if (this.type === 'add') {
                                    this.data.push(json);
                                    msg = '添加成功！'
                                }
                                this.$message({
                                    message: msg,
                                    type: 'success'
                                });
                            }
                        })
                    }
                });
            },
            add(){
                this.$refs.form && this.$refs.form.resetFields();
                for (let key in this.form) {
                    this.form[key] = (key === 'id' || key === 'sort') ? 0 : '';
                }
                this.visible = true;
                this.type = 'add';
            },
            filterNode(value, data) {
                if (!value) return true;
                return data.name.indexOf(value) !== -1;
            },
            headleClick(icon, data, store){
                if (icon === 'delete') {
                    this.$confirm('确定要删除吗？', '系统提醒', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        ajax.call(this, '/deleteHospital', {id: data.id}, (d, err) => {
                            if (!err) {
                                store.remove(data);
                            }
                        })
                    }).catch(() => {
                    });
                } else if (icon === 'plus' || icon === 'edit') {
                    this.$refs.form && this.$refs.form.resetFields();
                    this.type = icon;
                    const f = this.form;
                    if (icon === 'plus') {
                        for (let key in this.form) {
                            this.form[key] = key === 'id' ? 0 : '';
                        }
                    }else{
                        for (let key in this.form) {
                            this.form[key] = data[key];
                        }
                    }
                    this.parent_data = data;
                    this.visible = true;
                }
            },
            renderContent(h, {node, data, store}) {
                let but = (type, icon) => {
                    return h('el-button', {
                        props: {size: "small", type, icon,disabled:false}, on: {
                            click: () => {
                                this.headleClick(icon, data, store);
                            }
                        }
                    })
                };
                return h('span',[h('span', [h('span'), [node.label, h('span', {style: {color: '#999',marginLeft: '10px'}}, node.data.rank)]]),h('span', {style: {float: 'right',margin: '-2px 10px'}}, [but('warning', 'edit'), but('danger', 'delete')])]);
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
