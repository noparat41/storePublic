/****************************************************************************
** Meta object code from reading C++ file 'gpio.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.14.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../Register/gpio.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gpio.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.14.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Gpio_t {
    QByteArrayData data[22];
    char stringdata0[158];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Gpio_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Gpio_t qt_meta_stringdata_Gpio = {
    {
QT_MOC_LITERAL(0, 0, 4), // "Gpio"
QT_MOC_LITERAL(1, 5, 12), // "valueChanged"
QT_MOC_LITERAL(2, 18, 0), // ""
QT_MOC_LITERAL(3, 19, 3), // "val"
QT_MOC_LITERAL(4, 23, 4), // "init"
QT_MOC_LITERAL(5, 28, 7), // "setEdge"
QT_MOC_LITERAL(6, 36, 4), // "Edge"
QT_MOC_LITERAL(7, 41, 4), // "edge"
QT_MOC_LITERAL(8, 46, 9), // "readValue"
QT_MOC_LITERAL(9, 56, 10), // "writeValue"
QT_MOC_LITERAL(10, 67, 5), // "value"
QT_MOC_LITERAL(11, 73, 15), // "getCurrentValue"
QT_MOC_LITERAL(12, 89, 12), // "waitForValue"
QT_MOC_LITERAL(13, 102, 3), // "pin"
QT_MOC_LITERAL(14, 106, 9), // "threshold"
QT_MOC_LITERAL(15, 116, 9), // "Direction"
QT_MOC_LITERAL(16, 126, 2), // "IN"
QT_MOC_LITERAL(17, 129, 3), // "OUT"
QT_MOC_LITERAL(18, 133, 4), // "NONE"
QT_MOC_LITERAL(19, 138, 6), // "RISING"
QT_MOC_LITERAL(20, 145, 7), // "FALLING"
QT_MOC_LITERAL(21, 153, 4) // "BOTH"

    },
    "Gpio\0valueChanged\0\0val\0init\0setEdge\0"
    "Edge\0edge\0readValue\0writeValue\0value\0"
    "getCurrentValue\0waitForValue\0pin\0"
    "threshold\0Direction\0IN\0OUT\0NONE\0RISING\0"
    "FALLING\0BOTH"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Gpio[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       2,   62, // properties
       2,   68, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   49,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       4,    0,   52,    2, 0x02 /* Public */,
       5,    1,   53,    2, 0x02 /* Public */,
       8,    0,   56,    2, 0x02 /* Public */,
       9,    1,   57,    2, 0x02 /* Public */,
      11,    0,   60,    2, 0x02 /* Public */,
      12,    0,   61,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Int,    3,

 // methods: parameters
    QMetaType::Int,
    QMetaType::Void, 0x80000000 | 6,    7,
    QMetaType::Int,
    QMetaType::Void, QMetaType::Int,   10,
    QMetaType::Int,
    QMetaType::Void,

 // properties: name, type, flags
      13, QMetaType::Int, 0x00095103,
      14, QMetaType::Int, 0x00095102,

 // enums: name, alias, flags, count, data
      15,   15, 0x0,    2,   78,
       6,    6, 0x0,    4,   82,

 // enum data: key, value
      16, uint(Gpio::IN),
      17, uint(Gpio::OUT),
      18, uint(Gpio::NONE),
      19, uint(Gpio::RISING),
      20, uint(Gpio::FALLING),
      21, uint(Gpio::BOTH),

       0        // eod
};

void Gpio::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Gpio *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->valueChanged((*reinterpret_cast< const int(*)>(_a[1]))); break;
        case 1: { int _r = _t->init();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 2: _t->setEdge((*reinterpret_cast< Edge(*)>(_a[1]))); break;
        case 3: { int _r = _t->readValue();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 4: _t->writeValue((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: { int _r = _t->getCurrentValue();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 6: _t->waitForValue(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Gpio::*)(const int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Gpio::valueChanged)) {
                *result = 0;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Gpio *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->getPin(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Gpio *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setPin(*reinterpret_cast< int*>(_v)); break;
        case 1: _t->setThreshold(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject Gpio::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Gpio.data,
    qt_meta_data_Gpio,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Gpio::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Gpio::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Gpio.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Gpio::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Gpio::valueChanged(const int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
