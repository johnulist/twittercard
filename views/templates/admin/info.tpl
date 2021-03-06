{*
 * Copyright (C) StrikeHawk eCommerce, Inc. - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 *
 * @author    StrikeHawk eCommerce, Inc. <sales@services.strikehawk.com>
 * @copyright 2016 StrikeHawk eCommerce, Inc.
 * @license   proprietary
 * Intellectual Property of StrikeHawk eCommerce, Inc.
*}
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <div class="panel">
                <div class="panel-heading">
                    <i class="icon icon-info"></i> {l s='Thank you for your module purchase!' mod='twittercard'}
                </div>
                <div class="panel-body">
                    <p>
                        {l s='StrikeHawk eCommerce, Inc. would like to thank you for your recent module purchase. Support is limited to your envato support package add-on.' mod='twittercard'}
                    </p>
                    <p>
                        {l s='Module installation and configuration can be found in the video to the right and through our knowledgebase system link below the video. Any valid purchase with a valid envato support package may freely submit ticket issues in our support portal links found below. It will' mod='twittercard'} <strong>{l s='require' mod='twittercard'}</strong> {l s='an account registration prior to submitting your new issue.' mod='twittercard'}
                    </p>
                    <p>
                        <strong>{l s='Be sure to read the license agreement and legal disclaimer files found in your purchased zip archive file.' mod='twittercard'}</strong>
                    </p>
                    <ul class="list-unstyled">
                        <li style="padding-bottom: 20px;">
                            <i class="icon-check-square-o"
                               aria-hidden="true"></i> {l s='Register your module Support.' mod='twittercard'}
                            <a href="https://services.strikehawk.com/register.php" class="btn btn-info"
                               role="button">{l s='Link' mod='twittercard'}</a>
                        </li>
                        <li>
                            <i class="icon-child"
                               aria-hidden="true"></i> {l s='Support Portal For Registered Customers.' mod='twittercard'}
                            <a href="https://services.strikehawk.com/clientarea.php" class="btn btn-info"
                               role="button">{l s='Link' mod='twittercard'}</a>
                        </li>
                    </ul>
                </div>
                <div class="panel-footer">
                    <a id="modal-222958" href="#modal-container-222958" role="button" class="btn btn-primary pull-left footer-btn" data-toggle="modal">Newsletter Subscription</a>
                    <a href="https://analytics.twitter.com/user/{$twitterUser|replace:'@':''|escape:'htmlall':'UTF-8'}/twitter_cards"
                               target="_blank" title="Twitter Card Analytics" class="btn btn-primary pull-left footer-btn">Twitter Analyics</a>
                </div>
                <div class="modal fade" id="modal-container-222958" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">
                                    {l s='Newsletter Subscription' mod='twittercard'}
                                </h4>
                            </div>
                            <div class="modal-body">
                                <!-- Begin MailChimp Signup Form -->
                                <link href="//cdn-images.mailchimp.com/embedcode/classic-10_7.css" rel="stylesheet"
                                      type="text/css">
                                <div id="mc_embed_signup">
                                    <form action="//strikehawk.us8.list-manage.com/subscribe/post?u=b3d6d6ba3f9182a0a36ba0052&amp;id=5374327a0f"
                                          method="post" id="mc-embedded-subscribe-form"
                                          name="mc-embedded-subscribe-form" class="validate" target="_blank"
                                          novalidate>
                                        <div id="mc_embed_signup_scroll">
                                            <h2>Subscribe to our mailing list</h2>
                                            <div class="indicates-required"><span class="asterisk">*</span>
                                                indicates required
                                            </div>
                                            <div class="mc-field-group">
                                                <label for="mce-FNAME">First Name <span class="asterisk">*</span>
                                                </label>
                                                <input type="text" value="" name="FNAME" class="required"
                                                       id="mce-FNAME">
                                            </div>
                                            <div class="mc-field-group">
                                                <label for="mce-LNAME">Last Name <span class="asterisk">*</span>
                                                </label>
                                                <input type="text" value="" name="LNAME" class="required"
                                                       id="mce-LNAME">
                                            </div>
                                            <div class="mc-field-group">
                                                <label for="mce-EMAIL">Email Address <span class="asterisk">*</span>
                                                </label>
                                                <input type="email" value="" name="EMAIL" class="required email"
                                                       id="mce-EMAIL">
                                            </div>
                                            <div class="mc-field-group input-group">
                                                <strong>Choose Your Topics? </strong>
                                                <ul>
                                                    <li><input type="checkbox" value="1" name="group[11653][1]"
                                                               id="mce-group[11653]-11653-0"><label
                                                                for="mce-group[11653]-11653-0">PrestaShop</label>
                                                    </li>
                                                    <li><input type="checkbox" value="4" name="group[11653][4]"
                                                               id="mce-group[11653]-11653-1"><label
                                                                for="mce-group[11653]-11653-1">WordPress</label>
                                                    </li>
                                                    <li><input type="checkbox" value="8" name="group[11653][8]"
                                                               id="mce-group[11653]-11653-2"><label
                                                                for="mce-group[11653]-11653-2">osCommerce</label>
                                                    </li>
                                                    <li><input type="checkbox" value="2" name="group[11653][2]"
                                                               id="mce-group[11653]-11653-3"><label
                                                                for="mce-group[11653]-11653-3">CRE Loaded</label>
                                                    </li>
                                                    <li><input type="checkbox" value="16" name="group[11653][16]"
                                                               id="mce-group[11653]-11653-4"><label
                                                                for="mce-group[11653]-11653-4">Web Hosting
                                                            Tips</label></li>
                                                </ul>
                                            </div>
                                            <div class="mc-field-group input-group">
                                                <strong>Email Format </strong>
                                                <ul>
                                                    <li><input type="radio" value="html" name="EMAILTYPE"
                                                               id="mce-EMAILTYPE-0"><label for="mce-EMAILTYPE-0">html</label>
                                                    </li>
                                                    <li><input type="radio" value="text" name="EMAILTYPE"
                                                               id="mce-EMAILTYPE-1"><label for="mce-EMAILTYPE-1">text</label>
                                                    </li>
                                                </ul>
                                            </div>
                                            <p>
                                                <a href="http://us8.campaign-archive1.com/home/?u=b3d6d6ba3f9182a0a36ba0052&id=5374327a0f"
                                                   title="View previous campaigns">View previous campaigns.</a></p>
                                            <p>Powered by <a href="http://eepurl.com/TqyPL"
                                                             title="MailChimp - email marketing made easy and fun">MailChimp</a>
                                            </p>
                                            <div id="mce-responses" class="clear">
                                                <div class="response" id="mce-error-response"
                                                     style="display:none"></div>
                                                <div class="response" id="mce-success-response"
                                                     style="display:none"></div>
                                            </div>
                                            <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                                            <div style="position: absolute; left: -5000px;" aria-hidden="true">
                                                <input type="text" name="b_b3d6d6ba3f9182a0a36ba0052_5374327a0f"
                                                       tabindex="-1" value=""></div>
                                            <div class="clear"><input type="submit" value="Subscribe"
                                                                      name="subscribe" id="mc-embedded-subscribe"
                                                                      class="button"></div>
                                        </div>
                                    </form>
                                </div>
                                <script type='text/javascript'
                                        src='//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js'></script>
                                {literal}
                                    <script type='text/javascript'>(function ($) {
                                            window.fnames = new Array();
                                            window.ftypes = new Array();
                                            fnames[1] = 'FNAME';
                                            ftypes[1] = 'text';
                                            fnames[2] = 'LNAME';
                                            ftypes[2] = 'text';
                                            fnames[0] = 'EMAIL';
                                            ftypes[0] = 'email';
                                        }(jQuery));
                                        var $mcj = jQuery.noConflict(true);</script>
                                {/literal}
                                <!--End mc_embed_signup-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                    Close
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel">
                <div class="carousel slide" id="carousel-151629">
                    <ol class="carousel-indicators">
                        <li class="active" data-slide-to="0" data-target="#carousel-151629">
                        </li>
                        <li data-slide-to="1" data-target="#carousel-151629">
                        </li>
                        <li data-slide-to="2" data-target="#carousel-151629">
                        </li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img alt="Carousel Bootstrap First" src="{$imageDir|escape:'htmlall':'UTF-8'}tw-before.jpg" />
                        </div>
                        <div class="item">
                            <img alt="Carousel Bootstrap Second" src="{$imageDir|escape:'htmlall':'UTF-8'}tw-after.jpg" />
                        </div>
                        <div class="item">
                            <img alt="Carousel Bootstrap Third" src="{$imageDir|escape:'htmlall':'UTF-8'}product-twitter.jpg" />
                        </div>
                    </div>
                    <a class="left carousel-control" href="#carousel-151629" data-slide="prev">
                        <span class="icon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-151629" data-slide="next">
                        <span class="icon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel">
                <div class="panel-heading"><i
                            class="icon-twitter"></i> {l s='Twitter Summary Card w/ Large Image Tutorial' mod='twittercard'}
                </div>
                <div class="panel-body">
                    <div class="row embed-responsive embed-responsive-16by9">
                        <h4 class="modal-title" id="myModalLabel">
                            {l s='Installation Tutorial' mod='twittercard'}
                        </h4>
                        <div align="center">
                            <iframe align="center" class="embed-responsive-item" width="640" height="360"
                                    src="https://www.youtube-nocookie.com/embed/x6PVglpRnV4?rel=0&amp;showinfo=0"
                                    frameborder="0" allowfullscreen>
                            </iframe>
                        </div>
                    </div>
                    <div class="row">
                        <div align="center" class="">
                            <script src="https://apis.google.com/js/platform.js"></script>
                            <div align="center" class="g-ytsubscribe" data-channelid="UCVHjzEGC0GsBSMynK0fJmEg"
                                 data-layout="full" data-count="default"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
