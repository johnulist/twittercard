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
{if $smarty.const._PS_VERSION_|@addcslashes:'\'' < '1.6'}
    <fieldset>
        <legend>
            {l s='Twitter cards' mod='twittercard'}
        </legend>
        <p>
            {l s='Module info'}
            <br>
        </p>
    </fieldset>
{else}
    <div class="container-fluid" style="margin-top: 25px;">
        <div class="row">
            <div class="col-md-4">
                <h1>
                    {l s='Thank you for your module purchase!'}
                </h1>
                <p>
                    {l s='StrikkeHawk eCommerce, Inc. would like to thank you for your recent module purchase. Support is limited to your envato support package add-on.'}
                </p>
                <p>
                    {l s='Module installation and configuration can be found in the video to the right and through our knowledgebase system link below the video. Any valid purchase with a valid envato support package may freely submit ticket issues in our support portal links found below. It will <strong>require</strong> an account registration prior to submitting your new issue.'}
                </p>
                <p><strong>{l s='Be sure to read the license agreement and legal disclaimer files found in your purchased zip archive file.'}</strong></p>
                <div class="well well-lg">
                    <ul class="list-unstyled">
                        <li style="padding-bottom: 20px;">
                            <i class="icon-check-square-o" aria-hidden="true"></i> {l s='Register your module Support.'}
                            <a href="https://services.strikehawk.com/register.php" class="btn btn-info" role="button">{l s='Link'}</a>
                        </li>
                        <li>
                            <i class="icon-child" aria-hidden="true"></i> {l s='Support Portal For Registered Customers.'}
                            <a href="https://services.strikehawk.com/clientarea.php" class="btn btn-info" role="button">{l s='Link'}</a>
                        </li>
                    </ul>
                    <div class="clear">&nbsp;</div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="media well">
                    <div class="media-body">
                        <h2 class="media-heading">
                            {l s='Installation Tutorial'}
                        </h2>
                        <div class="media" align="center">
                            <iframe width="640" height="360"
                                    src="https://www.youtube-nocookie.com/embed/x6PVglpRnV4?rel=0&amp;showinfo=0"
                                    frameborder="0" allowfullscreen></iframe>
                            <div class="media-body">
                                <h2 class="media-heading">
                                    {l s='Twitter Card with Large Image Video Tutorial'}
                                </h2>
                                <p>
                                    {l s='If you are still confused after watching the video or cannot see its content, click here to read the full knowledgebase article.'}
                                </p>
                                <p>
                                    <a href="#" class="btn btn-info" role="button">{l s='Open External Link'}</a>
                                </p>
                            </div>
                            <script src="https://apis.google.com/js/platform.js"></script>

                            <div class="g-ytsubscribe" data-channelid="UCVHjzEGC0GsBSMynK0fJmEg" data-layout="full"
                                 data-count="default"></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1 class="panel-title">
                            {l s'PrestaShop Low Traffic Hosting' mod='twittercard'} <span class="lead text-danger pull-right">$9.95/mo</span>
                        </h1>
                    </div>
                    <div class="panel-body">
                        <figure>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>
                                        {l s='Feature' mod='twittercard'}
                                    </th>
                                    <th>
                                        Details
                                    </th>
                                    <th>
                                        Available
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>

                                    <td>
                                        Disk Quota
                                    </td>
                                    <td>
                                        2 Gigabytes
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="active">

                                    <td>
                                        Traffic Bandwidth
                                    </td>
                                    <td>
                                        25 Gigabytes
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="info">
                                    <td>
                                        Email Accounts
                                    </td>
                                    <td>
                                        5 Pop3/Imap Users
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>
                                        Cart Support
                                    </td>
                                    <td>
                                        Email
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td>
                                        SSL Security
                                    </td>
                                    <td>
                                        SSL Certificate
                                    </td>
                                    <td>
                                        $16.50/yr
                                    </td>
                                </tr>
                                <tr class="danger">

                                    <td>
                                        Storage Device
                                    </td>
                                    <td>
                                        Solid State Drive
                                    </td>
                                    <td>
                                        $5.95/mo
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <figcaption>Free Migration or Installation</figcaption>
                        </figure>
                    </div>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-block btn-lg btn-success active" type="button">Order Hosting</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1 class="panel-title">
                            PrestaShop Medium Traffic Hosting <span class="pull-right"><span class="text-danger lead">$19.95/mo</span> USD</span>
                        </h1>
                    </div>
                    <div class="panel-body">
                        <figure>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>
                                        Feature
                                    </th>
                                    <th>
                                        Details
                                    </th>
                                    <th>
                                        Available
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        Disk Quota
                                    </td>
                                    <td>
                                        4 Gigabytes
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="active">
                                    <td>
                                        Traffic Bandwidth
                                    </td>
                                    <td>
                                        50 Gigabytes
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="info">
                                    <td>
                                        Email Accounts
                                    </td>
                                    <td>
                                        10 Pop3/Imap Users
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>
                                        Cart Support
                                    </td>
                                    <td>
                                        Email, Skype
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td>
                                        SSL Security
                                    </td>
                                    <td>
                                        SSL Certificate
                                    </td>
                                    <td>
                                        $16.50/yr
                                    </td>
                                </tr>
                                <tr class="danger">
                                    <td>
                                        Storage Device
                                    </td>
                                    <td>
                                        Solid State Drive
                                    </td>
                                    <td>
                                        $5.95/mo
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <figcaption>Free Migration or Installation</figcaption>
                        </figure>
                    </div>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-block btn-lg btn-success active" type="button">Order Hosting</a>
                    </div>
                </div>

            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h1 class="panel-title">
                            PrestaShop High Traffic Hosting <span class="pull-right"><span class="text-danger lead">$29.95/mo</span> USD</span>
                        </h1>
                    </div>
                    <div class="panel-body">
                        <figure>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>
                                        Feature
                                    </th>
                                    <th>
                                        Details
                                    </th>
                                    <th>
                                        Available
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        Disk Quota
                                    </td>
                                    <td>
                                        8 Gigabytes
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="active">
                                    <td>
                                        Traffic Bandwidth
                                    </td>
                                    <td>
                                        100 Gigabytes
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="info">
                                    <td>
                                        Email Accounts
                                    </td>
                                    <td>
                                        20 Pop3/Imap Users
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>
                                        Cart Support
                                    </td>
                                    <td>
                                        Email, Skype, Phone
                                    </td>
                                    <td>
                                        Yes
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td>
                                        SSL Security
                                    </td>
                                    <td>
                                        SSL Certificate
                                    </td>
                                    <td>
                                        $16.50/yr
                                    </td>
                                </tr>
                                <tr class="danger">
                                    <td>
                                        Storage Device
                                    </td>
                                    <td>
                                        Solid State Drive
                                    </td>
                                    <td>
                                        Free
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <figcaption>Free Migration or Installation</figcaption>
                        </figure>
                    </div>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-block btn-lg btn-success active" type="button">Order Hosting</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="padding-left: 18px;">
                            <i class="icon-hand-right" aria-hidden="true"></i> &nbsp; eCommerce Secure Cloud VPS Hosting
                        </h3>
                    </div>
                    <div class="panel-body">
                        <p class="lead">
                            All Cloud VPS servers are reconfigured to meet PCI DSS requirements including a full line of security best practices before turning it over to our customers. Our techs are trained and certified to work on your behalf.
                        </p>
                        <p class="lead">
                            We fully support the PrestaShop shopping cart and provide free cart support and limited software coding support for a professional fee quoted upon project approval.
                        </p>
                    </div>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-block btn-lg btn-success active" type="button">More Information</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="padding-left: 18px;">
                            <i class="icon-hand-right" aria-hidden="true"></i> &nbsp; eCommerce Secure Dedicated Servers
                        </h3>
                    </div>
                    <div class="panel-body">
                        <p class="lead">
                            Our line of dual and quad core servers are fully managed and hardened for PCI DSS. Your server will be optimized to meet and exceed PrestaShop server requirements. Includes intrusion detection and firewall.
                        </p>
                        <p>
                        <p class="lead">We fully support the PrestaShop shopping cart and provide free cart support and limited software coding support for a professional fee quoted upon project approval.</p>
                        </p>
                    </div>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-block btn-lg btn-success active" type="button">More Information</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}
