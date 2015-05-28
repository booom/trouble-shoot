package org.test.jvmtools;

import sun.jvm.hotspot.tools.jcore.ClassFilter;
import sun.jvm.hotspot.oops.InstanceKlass;

/**
 * @author jason@wemart.cn
 * @created 2015/5/28
 */
public class MyFilter implements ClassFilter {
    @Override
    public boolean canInclude(InstanceKlass kls) {
        String klassName = kls.getName().asString();
        return klassName.startsWith("cn/wemart/wmapi/gm/virtualgoods/api/WmVirtualGoodsMng");
    }
}