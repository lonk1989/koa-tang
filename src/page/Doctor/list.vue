<template>
    <div>
        <el-row class="grid-table">
            <el-form :inline="true" :model='search_data'>
                <el-form-item label="手机">
                    <el-input size="small" v-model="search_data.phone"></el-input>
                </el-form-item>
                <el-form-item label="姓名">
                    <el-input size="small" v-model="search_data.name"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button size="small" icon="search" @click='onSearch'>查询</el-button>
                    <el-button size="small" icon="plus" type="primary" @click='add'>添加医生</el-button>
                </el-form-item>
            </el-form>
            <el-button type="danger" @click='deleteDoctor()'>批量删除</el-button>
            <el-table stripe border style="width:100%;margin-top:10px" :data="table_data.data" @selection-change="handleSelectionChange">
                <el-table-column type="selection" width="55"></el-table-column>
                <el-table-column
                    show-overflow-tooltip
                    v-for="item in table_data.columns"
                    :label="item.name"
                    :key="item.key"
                    :prop="item.key"
                    :formatter="columnFormatter"
                    :min-width="item.minWidth" :width="item.width">
                </el-table-column>
            </el-table>
        </el-row>
    </div>
</template>
<script type="text/javascript">
    import {ajax,storage} from 'utils';
    import common from 'common';
    module.exports = {
        name: 'list',
        data() {
            return {
                search_data: {
                    phone: '',
                    name: '',
                    hospital: ''
                },
                multipleSelection:[],
                table_data: {
                    columns: [
                        {"key": "phone", "name": "医生手机号", width: 150},
                        {"key": "name", "name": "医生姓名", Width: 150},
                        {"key": "hospital", "name": "医生所属医院", width: 150},
                        {"key": "operations", "name": "操作", width: 135}
                    ],
                    data: []
                }
            }
        },
        methods: {
            ajaxData(){
                ajax.call(this, '/listDoctor', this.search_data, (obj, err) => {
                    if (!err) {
                        this.table_data.data = obj.data;
                    }
                });
            },
            onSearch() {
                this.ajaxData();
            },
            createButton(h, row, code, text){
                let self = this;
                let dis = false;
                return h('el-button', {
                    props: {size: 'small',disabled:dis},
                    on: {
                        click(){
                            self.healColumnClick(code, row)
                        }
                    }
                },[text])
            },
            columnFormatter(row, column){
                let key = column.property;
                let str = row[key]+'';
                let h = this.$createElement;
                if(key === 'create_time'){
                    str = str.replace(/[^-\d].+/,'');
                }else if(key === 'operations'){
                    return h('div',[
                        this.createButton(h,row,'edit','编辑'),
                        this.createButton(h,row,'delete','删除'),
                    ])
                }
                return str;
            },
            deleteDoctor(arr){
                if(!arr){
                    if(this.multipleSelection.length){
                        arr = this.multipleSelection;
                    }else{
                        return this.$message("请先选择医生");
                    }
                }
                this.$confirm(`确定要${arr.length>1?'批量删除医生':'删除此医生'}吗？`, '系统提醒', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    ajax.call(this, '/deleteDoctor', {ids:arr.map(o=>o.id).join(",")}, (d, err) => {
                        !err && this.ajaxData();
                    })
                }).catch(() => {});
            },
            passedDoctor(arr){
                ajax.call(this, '/passedDoctor', {ids:arr.map(o=>o.id).join(",")}, (obj, err) => {
                    if (!err) {
                        arr.forEach(row=>{
                            row.passed = obj.passed;
                        })
                    }
                });
            },
            add(){
                this.$router.push('/doctor/add');
            },
            handleSelectionChange(val){
                this.multipleSelection = val;
            },
            healColumnClick(code, row){
                if(code ==='edit'){
                    this.$router.push('/doctor/edit/'+row.id);
                }else if(code ==='passed'){
                    this.passedDoctor([row]);
                }else if(code === 'delete'){
                    this.deleteDoctor([row]);
                }
            },
        },
        mounted() {
            this.ajaxData();
        },
        mixins:[common.mixin]
    }
</script>
<style lang="less">
    .grid-table{
        .el-form-item{
            display: inline-block;
            max-height:240px;
            width:~'calc(24% - 10px)';
            &:first-child{
                .el-input{
                    margin-right:25px;
                }
            }
            &:last-child{
                overflow: hidden;
                white-space: nowrap;
                vertical-align: bottom;
            }
        }
        .el-pagination{
            margin-top:5px;
            text-align: right;
        }
        .el-cascader--small .el-cascader__label{
            line-height: 40px;
        }
    }
</style>
