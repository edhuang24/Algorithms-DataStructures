var adsInfo = [{
        path: '/123456/BTF',
        sizes: [
            [300, 250],
            [320, 50],
            [1, 1]
        ],
        type: 's',
        id: '1',
        targeting: 'automotive'
    }, {
        path: '/234567/ATF',
        sizes: [
            [320, 50],
            [300, 250]
        ],
        type: 'j',
        id: '2',
        targeting: 'automotive'
    }, {
        path: '/21854401/Mobile_Third_Box_BTF',
        sizes: [
            [320, 50],
            [300, 250]
        ],
        type: 'm',
        id: '3',
        targeting: 'automotive'
    }]


/**
I would like the output to look like this for each object:
[{
    id: '1',
    path: '/123456/BTF',
    sizes: [ [300,250], [320,50], [1,1] ]
},{
    id: '2',
    path: '/234567/ATF',
    sizes: [ [320,50], [300,250] ] },
{
    id: '3',
    path: '/21854401/Mobile_Third_Box_BTF',
    sizes: [ [320,50], [300,250] ]
}]
**/

// original function
var adsInfoParser = function (info) {
    var result = [];
    for (i = 0; i < info.length; i++) {
        var newObj = {};
        newObj.path = info[i].path;
        newObj.sizes = info[i].sizes;
        newObj.type = info[i].type;
        result.push(newObj);
    }
    return result;
};

// re-factored function
var adsInfoParser = function (info) {
    return info.map(function (el) {
        return { path: el.path, sizes: el.sizes, type: el.type };
    });
};
