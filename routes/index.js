var express = require('express');
var router = express.Router();
//var util = require("util");
var fs = require("fs");
var multer = require('multer');
var upload = multer({
    dest: 'tmp/'
});
var unoconv = require('../unoconv');

var type = upload.single('conv');
router.get('/', function(req, res) {
    res.render('form');
});

router.post('/pdf', type, function(req, res, next) {
    var fileName = req.file.path;
    if (req.file.size !== 0) {
        unoconv.convert(req.file.path, 'pdf', function(err, result) {
            if (err) {
                res.end("Error LibreOffice convert file!!!");
            }
            res.sendFile(req.file.filename + '.pdf', { root: 'tmp' }, function(err){
                if(err) {
                    console.log(err);
                }
                fs.unlinkSync(req.file.path);
                fs.unlinkSync(req.file.path + '.pdf');
            });
        });
    } else {
        res.end("no:");
    }
});

module.exports = router;