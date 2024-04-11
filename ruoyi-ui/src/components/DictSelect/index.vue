<template>
  <!-- 下拉框 -->
  <el-select
    v-if="type === 'select'"
    v-bind="this.$attrs"
    filterable
    v-on="listeners"
  >
    <el-option
      v-for="item in options"
      :key="item[valueProp]"
      :label="item[labelProp]"
      :value="item[valueProp]"
    />
  </el-select>
  <!-- 单选框 -->
  <el-radio-group v-else-if="type === 'radio'" v-bind="this.$attrs" filterable v-on="listeners" >
    <el-radio v-for="item in options" :key="item[valueProp]" :label="item[valueProp]">{{ item[labelProp] }}</el-radio>
  </el-radio-group>
</template>

<script>
import store from "@/store";

export default {
  name: 'DictSelect',
  dicts: null,
  props: {
    // 字典类型
    dictType: {
      type: String,
      required: true
    },
    // 组件select\radio
    type: {
      type: String,
      default: 'select'
    },
    // 指定包含的值
    include: {
      type: Array,
      default: null
    },
    // 指定的排除值
    exclude: {
      type: Array,
      default: null
    },
    // 显示的字段
    labelProp: {
      type: String,
      default: 'label'
    },
    // 值的字段
    valueProp: {
      type: String,
      default: 'value'
    }
  },
  data() {
    // 全局混入之前设置字典类型
    this.$options.dicts = [this.dictType]
    return {
      options: []
    }
  },
  computed: {
    // 覆盖change事件
    listeners() {
      return Object.assign(this.$listeners, {
        change: this.change
      })
    }
  },

  methods: {
    // 加载数据
    onDictReady() {
      this.options = this.dict.type[this.dictType]
      // 需要指定值
      if (this.include) {
        this.options = this.options.filter(item => this.include.indexOf(item[this.valueProp]) >= 0)
      }
      // 排除指定值
      if (this.exclude) {
        this.options = this.options.filter(item => this.exclude.indexOf(item[this.valueProp]) === -1)
      }
    },
    // 返回字典对象
    change(val){
      if(val){
        this.options.map(item=>{
          if(val===item[this.valueProp]){
            this.$emit('change',val, item)
            return
          }
        })
      }else{
        this.$emit('change')
      }
    }
  }
}
</script>
<style scoped>
.el-tag + .el-tag {
  margin-left: 10px;
}
</style>
