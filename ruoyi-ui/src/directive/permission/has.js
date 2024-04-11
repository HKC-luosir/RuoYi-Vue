/**
* v-has 操作权限处理
* Copyright (c) 2022 码农小易
*/

import store from '@/store'

export default {
    inserted(el, binding, vnode) {
        const { value } = binding;
        const all_permission = "*:*:*";
        const super_admin = "admin";

        const permissions = store.getters && store.getters.permissions
        const roles = store.getters && store.getters.roles

        const R = /R\((.*?)\)/g;
        const Rs = value.match(R) || [];

        const P = /P\((.*?)\)/g;
        const Ps = value.match(P) || [];

        if (Ps.length === 0 || Rs.length === 0){
            throw new Error(`请设置操作权限标签值`);
        }
        
        if (roles.some((role) => (super_admin === role))){
            return;
        }
        if (permissions.some((permission) => (all_permission === permission))){
            return;
        }

        var expression = value;

        for (let i = 0; i < Rs.length; i++) {
            const hasRole = roles.some(role => {
                return Rs[i] === `R(${role})`;
            })

            expression = hasRole ? expression.replace(Rs[i], 'true') : expression.replace(Rs[i], 'false');
        }

        for (let i = 0; i < Ps.length; i++) {
            const hasPermi = permissions.some(permission => {
                return Ps[i] === `P(${permission})`;
            })

            expression = hasPermi ? expression.replace(Ps[i], 'true') : expression.replace(Ps[i], 'false');
        }

        if (!eval(expression)) {
            el.parentNode && el.parentNode.removeChild(el);
        }
        
    }
}
