<template>
    <div>
        <el-row class="grid-table">
            <el-form :inline="true" :model='search_data'>
                <el-form-item label="药品名称">
                    <el-input size="small" v-model="search_data.name"></el-input>
                </el-form-item>
                <el-form-item label="药品分类">
                    <el-select size="small" v-model="search_data.medicine_type_id">
                        <el-option label="全部" value=""></el-option>
                        <el-option v-for="(item,key) in medicine_type_data" :key="key"
                                   :label="item" :value="key">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    <el-button size="small" icon="search" @click='onSearch'>查询</el-button>
                    <el-button size="small" icon="plus" type="primary" @click='add'>添加</el-button>
                </el-form-item>
            </el-form>
            <el-button type="danger" @click='deleteMedicine()'>批量删除</el-button>
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
            <el-pagination
                @current-change="handleCurrentChange"
                :current-page="search_data.page"
                :page-size="search_data.pageSize"
                layout="total, prev, pager, next,jumper"
                :total="table_data.total">
            </el-pagination>
        </el-row>
        <el-dialog :title="getTitle" :visible.sync="visible" size="tiny">
            <el-form :model="form" :rules="rules" label-width="80px" ref="form">
                <el-form-item label="名称" prop="name">
                    <el-input v-model="form.name"></el-input>
                </el-form-item>
                <el-form-item label="药品类别" prop="medicine_type_id">
                    <el-select v-model="form.medicine_type_id" ref="select"
                               style="width: 100%">
                        <el-option v-for="(item,key) in medicine_type_data" :key="key" :label="item" :value="key">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="单位(例：g)" prop="unit">
                    <el-input v-model="form.unit"></el-input>
                </el-form-item>
                <el-form-item label="单价（元）(例：10.00)" prop="price">
                    <el-input v-model="form.price"></el-input>
                </el-form-item>
                <el-form-item label="规格(例：6g*10袋)" prop="spec">
                    <el-input v-model="form.spec"></el-input>
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
        name: 'list',
        data() {
            return {
                search_data: {
                    name: '',
                    medicine_type_id: '',
                    page: 1,
                    pageSize: 10
                },
                parent_data: null,
                loading: false,
                medicine_type_data: [],
                multipleSelection:[],
                form: {
                    id: 0,
                    name: '',
                    medicine_type_id: '',
                    unit: '',
                    price: '',
                    spec: '',
                    sort: 0,
                },
                rules: {
                    name: {required: true, trigger: 'change'},
                    medicine_type_id: {required: true, trigger: 'change'},
                    unit: {required: true, trigger: 'change'},
                    price: {required: true, trigger: 'change'}
                },
                type: 'edit',
                visible: false,
                table_data: {
                    columns: [
                        {"key": "name", "name": "药品名称", width: 150},
                        {"key": "medicine_type_id", "name": "药品分类", width: 150},
                        {"key": "unit", "name": "单位", width: 150},
                        {"key": "price", "name": "价格", width: 150},
                        {"key": "spec", "name": "规格"},
                        {"key": "operations", "name": "操作", width: 135}
                    ],
                    data: []
                }
            }
        },
        methods: {
            ajaxData(){
                ajax.call(this, '/listMedicine', this.search_data, (obj, err) => {
                    if (!err) {
                        this.table_data.data = obj.data;
                        this.table_data.total = obj.total;
                        this.search_data.page = obj.page;
                    }
                });
            },
            onSearch() {
                this.ajaxData();
            },
            handleCurrentChange(page){
                if(page !== this.search_data.page){
                    this.search_data.page = page;
                    this.ajaxData();
                }
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
                if (str==='null') str = ''
                if (key === 'medicine_type_id') {
                    str = this.medicine_type_data[str]
                }else if(key === 'create_time'){
                    str = str.replace(/[^-\d].+/,'');
                }else if(key === 'operations'){
                    return h('div',[
                        this.createButton(h,row,'edit','编辑'),
                        this.createButton(h,row,'delete','删除'),
                    ])
                }
                return str;
            },
            deleteMedicine(arr){
                if(!arr){
                    if(this.multipleSelection.length){
                        arr = this.multipleSelection;
                    }else{
                        return this.$message("请先选择药品");
                    }
                }
                this.$confirm(`确定要${arr.length>1?'批量删除药品':'删除此药品'}吗？`, '系统提醒', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    ajax.call(this, '/deleteMedicine', {ids:arr.map(o=>o.id).join(",")}, (d, err) => {
                        !err && this.ajaxData();
                    })
                }).catch(() => {});
            },
            save(){
                this.$refs.form.validate(v => {
                    if (v) {
                        this.visible = true;
                        this.loading = true;
                        ajax.call(this, '/updateMedicine', this.form, (data, err) => {
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
            handleSelectionChange(val){
                this.multipleSelection = val;
            },
            healColumnClick(code, row){
                console.log(row)
                if(code ==='edit'){
                    this.$refs.form && this.$refs.form.resetFields();
                    this.type = 'edit';
                    for (let key in this.form) {
                        this.form[key] = row[key];
                    }
                    this.parent_data = row;
                    this.visible = true;
                }else if(code === 'delete'){
                    this.deleteMedicine([row]);
                }
            },
        },
        computed: {
            getTitle(){
                return this.type === 'edit' ? '编辑' : '添加';
            }
        },
        mounted() {
            this.ajaxData();
            ajax.call(this, '/listMedicineType', {}, (data, err) => {
                if (!err) {
                    let arr = data.data
                    let obj = {}
                    arr.map((o,i) => {
                        obj[o.id.toString()] = o.name
                    })
                    this.medicine_type_data = obj
                }
            });
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
