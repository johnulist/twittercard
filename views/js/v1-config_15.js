/**
 * Copyright (C) StrikeHawk eCommerce, Inc. - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 *
 * @author    StrikeHawk eCommerce, Inc. <sales@services.strikehawk.com>
 * @copyright 2016 StrikeHawk eCommerce, Inc.
 * @license   proprietary
 * Intellectual Property of StrikeHawk eCommerce, Inc.
 */
(function() {
    $(document).ready(function () {
        checkImageLogo();
        $('#TWITTERCARD_TWITTERHOMEIMAGE_on, #TWITTERCARD_TWITTERHOMEIMAGE_off').change(function () {
            checkImageLogo();
        });
    });

    function checkImageLogo() {
        if ($('#TWITTERCARD_TWITTERHOMEIMAGE_on').is(':checked')) {
            $('#TWITTERCARD_TWITTERHOMEIMAGEURL').parent().show();
            $('#TWITTERCARD_TWITTERHOMEIMAGEURL').parent().prev().show();
            $('#TWITTERCARD_TWITTERHOMEIMAGEURL').parent().prev().prev().show();
        } else {
            $('#TWITTERCARD_TWITTERHOMEIMAGEURL').parent().hide();
            $('#TWITTERCARD_TWITTERHOMEIMAGEURL').parent().prev().hide();
            $('#TWITTERCARD_TWITTERHOMEIMAGEURL').parent().prev().prev().hide();
        }
    }
})();

