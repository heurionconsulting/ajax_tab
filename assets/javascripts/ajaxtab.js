var ajaxTabSelTabIds = new Hash;
var ajaxTabAjaxStatus = new Hash;
var authenticityToken;

function select_tab(name, tabid, url)
{
    var previousTab, currentTab;

    if(ajaxTabSelTabIds[name] == undefined)
    {
        ajaxTabSelTabIds[name] = -1;
    }
    if(ajaxTabAjaxStatus[name + '_tab_' + tabid] == undefined)
    {
        ajaxTabAjaxStatus[name + '_tab_' + tabid] = -1;
    }
    
    if(ajaxTabSelTabIds[name] != tabid)
    {
        var previousTab = document.getElementById(name + '_tab_' + ajaxTabSelTabIds[name]);
        var currentTab = document.getElementById(name + '_tab_' + tabid);
        var previousTabContent = document.getElementById(name + '_content_' + ajaxTabSelTabIds[name]);
        var currentTabContent = document.getElementById(name + '_content_' + tabid);
        
        var ajaxtabLoadingImage = document.getElementById(name + "_" + tabid + "_loadingimage");

        if(ajaxtabLoadingImage && ajaxTabAjaxStatus[currentTab.id] == -1)
        {
            loading = document.getElementById(currentTab.id + "_onloading").value;
            complete = document.getElementById(currentTab.id + "_oncomplete").value;
            success = document.getElementById(currentTab.id + "_onsuccess").value;
            failure = document.getElementById(currentTab.id + "_onfailure").value;
            
            if(authenticityToken)
            {
                new Ajax.Updater(currentTabContent.id, url, {asynchronous:true, evalScripts:true, method:'post', onLoading:function(request){eval(loading)}, onComplete:function(request){eval(complete); if(request.status!=200){} }, onFailure:function(request){eval(failure); ajaxTabAjaxStatus[currentTab.id] = -1;}, onSuccess:function(request){eval(success); ajaxTabAjaxStatus[currentTab.id] = 0;}, parameters:'authenticity_token=' + encodeURIComponent(authenticityToken)});
            }
            else
            {
                new Ajax.Updater(currentTabContent.id, url, {asynchronous:true, evalScripts:true, method:'get', onLoading:function(request){eval(loading)}, onComplete:function(request){eval(complete); if(request.status!=200){} }, onFailure:function(request){eval(failure); ajaxTabAjaxStatus[currentTab.id] = -1;}, onSuccess:function(request){eval(success); ajaxTabAjaxStatus[currentTab.id] = 0;}});
            }
        }
        
        if(previousTab)
        {
            previousTabOndeselect = document.getElementById(previousTab.id + "_ondeselect");
            if(previousTabOndeselect)
            {
                eval(previousTabOndeselect.value);
            }
            previousTab.className = name + "_tab ajaxtab_unsel_tab";
            previousTabContent.className = name + "_content ajaxtab_unsel_content";
        }
        
        if(currentTab)
        {
            currentTab.className = name + "_tab ajaxtab_sel_tab";
            currentTabContent.className = name + "_content ajaxtab_sel_content";
            currentTabOnselect = document.getElementById(currentTab.id + "_onselect");
            if(currentTabOnselect)
            {
                eval(currentTabOnselect.value);
            }
        }
        
        ajaxTabSelTabIds[name] = tabid;
    }
}


/*
    Author: Harish
    Email: p.harish86@gmail.com
    Blog: http://harishwords.wordpress.com
*/