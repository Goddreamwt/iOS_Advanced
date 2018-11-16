
// 1.objc_xxx 系列函数
// 函数名称     函数作用
objc_getClass     获取Class对象
objc_getMetaClass     获取MetaClass对象
objc_allocateClassPair     分配空间,创建类(仅在 创建之后,注册之前 能够添加成员变量)
objc_registerClassPair     注册一个类(注册后方可使用该类创建对象)
objc_disposeClassPair     注销某个类
objc_allocateProtocol     开辟空间创建协议
objc_registerProtocol     注册一个协议
objc_constructInstance     构造一个实例对象(ARC下无效)
objc_destructInstance     析构一个实例对象(ARC下无效)
objc_setAssociatedObject     为实例对象关联对象
objc_getAssociatedObje*ct     获取实例对象的关联对象
objc_removeAssociatedObjects     清空实例对象的所有关联对象


objc_系列函数关注于宏观使用,如类与协议的空间分配,注册,注销等操作

// 2.class_xxx 系列函数
函数名称     函数作用
class_addIvar     为类添加实例变量
class_addProperty     为类添加属性
class_addMethod     为类添加方法
class_addProtocol     为类遵循协议
class_replaceMethod     替换类某方法的实现
class_getName     获取类名
class_isMetaClass     判断是否为元类
objc_getProtocol     获取某个协议
objc_copyProtocolList     拷贝在运行时中注册过的协议列表
class_getSuperclass     获取某类的父类
class_setSuperclass     设置某类的父类
class_getProperty     获取某类的属性
class_getInstanceVariable     获取实例变量
class_getClassVariable     获取类变量
class_getInstanceMethod     获取实例方法
class_getClassMethod     获取类方法
class_getMethodImplementation     获取方法的实现
class_getInstanceSize     获取类的实例的大小
class_respondsToSelector     判断类是否实现某方法
class_conformsToProtocol     判断类是否遵循某协议
class_createInstance     创建类的实例
class_copyIvarList     拷贝类的实例变量列表
class_copyMethodList     拷贝类的方法列表
class_copyProtocolList     拷贝类遵循的协议列表
class_copyPropertyList     拷贝类的属性列表

-

class_系列函数关注于类的内部,如实例变量,属性,方法,协议等相关问题

// 3.object_xxx 系列函数
函数名称     函数作用
object_copy     对象copy(ARC无效)
object_dispose     对象释放(ARC无效)
object_getClassName     获取对象的类名
object_getClass     获取对象的Class
object_setClass     设置对象的Class
object_getIvar     获取对象中实例变量的值
object_setIvar     设置对象中实例变量的值
object_getInstanceVariable     获取对象中实例变量的值 (ARC中无效,使用object_getIvar)
object_setInstanceVariable     设置对象中实例变量的值 (ARC中无效,使用object_setIvar)

-

objcet_系列函数关注于对象的角度,如实例变量

// 4.method_xxx 系列函数
函数名称     函数作用
method_getName     获取方法名
method_getImplementation     获取方法的实现
method_getTypeEncoding     获取方法的类型编码
method_getNumberOfArguments     获取方法的参数个数
method_copyReturnType     拷贝方法的返回类型
method_getReturnType     获取方法的返回类型
method_copyArgumentType     拷贝方法的参数类型
method_getArgumentType     获取方法的参数类型
method_getDescription     获取方法的描述
method_setImplementation     设置方法的实现
method_exchangeImplementations     替换方法的实现

-

method_系列函数关注于方法内部,如果方法的参数及返回值类型和方法的实现

// 5.property_xxx 系列函数
函数名称     函数作用
property_getName     获取属性名
property_getAttributes     获取属性的特性列表
property_copyAttributeList     拷贝属性的特性列表
property_copyAttributeValue     拷贝属性中某特性的值

-

property_系类函数关注与属性*内部,如属性的特性等

// 6.protocol_xxx 系列函数
函数名称     函数作用
protocol_conformsToProtocol     判断一个协议是否遵循另一个协议
protocol_isEqual     判断两个协议是否一致
protocol_getName     获取协议名称
protocol_copyPropertyList     拷贝协议的属性列表
protocol_copyProtocolList     拷贝某协议所遵循的协议列表
protocol_copyMethodDescriptionList     拷贝协议的方法列表
protocol_addProtocol     为一个协议遵循另一协议
protocol_addProperty     为协议添加属性
protocol_getProperty     获取协议中的某个属性
protocol_addMethodDescription     为协议添加方法描述
protocol_getMethodDescription     获取协议中某方法的描述

// 7.ivar_xxx 系列函数
函数名称     函数作用
ivar_getName     获取Ivar名称
ivar_getTypeEncoding     获取类型编码
ivar_getOffset     获取偏移量

// 8.sel_xxx 系列函数
函数名称     函数作用
sel_getName     获取名称
sel_getUid     注册方法
sel_registerName     注册方法
sel_isEqual     判断方法是否相等

// 9.imp_xxx 系列函数
函数名称     函数作用
imp_implementationWithBlock     通过代码块创建IMP
imp_getBlock     获取函数指针中的代码块
imp_removeBlock     移除IMP中的代码块
