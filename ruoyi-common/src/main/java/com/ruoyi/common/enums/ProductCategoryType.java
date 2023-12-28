package com.ruoyi.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ProductCategoryType {
    PULL_PEOPLE(0, "拉人进群")
    ;

    int id;
    String name;
}
