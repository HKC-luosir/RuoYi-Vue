<template>
  <el-select
    filterable
    :multiple="multiple"
    :filter-method="match"
    @focus="focus"
    v-model="changeValue"
    @change="change"
    clearable
    placeholder="请选择"
    :disabled="disabled"
    class="input">
    <el-option
      v-for="dict in filterList"
      :key="dict.value"
      :label="dict.label"
      :value="dict.value"
    ></el-option>
  </el-select>
</template>

<script>
import PinYinMatch from 'pinyin-match';

export default {
  name: "DictSelect"
  /***
   * value 设置选中
   * dictArr 列表dict对象集合
   * disabled 是否不可选
   * reactEvent 选中后回调，比如要做联动
   */
  ,props: ['value','dictArr','disabled','multiple','reactEvent']
  ,data(){
    return {
      changeValue: null
      ,filterList: this.dictArr // copy 的数据源
    }
  }
  ,created () {
  }
  ,watch: {
    value: {
      immediate: true,
      handler(value) {
        /** 初始化value值 */
        this.changeValue = value;
      }
    }
  }
  ,methods: {
    change(){
      this.$emit('input', this.changeValue);
      if(typeof this.reactEvent === "function"){
        this.reactEvent(this.changeValue);
      }
    }
    ,focus() {
      this.filterList = this.dictArr
    }
    ,match(val) {
      if (val) {
        let result = [];
        this.dictArr.forEach(item => {
          let matchRes = PinYinMatch.match(item.label, val);
          if (matchRes) {
            result.push(item);
          }
        });
        this.filterList = result;
      } else {
        this.filterList = this.list;
      }
    }
  }

}
</script>
