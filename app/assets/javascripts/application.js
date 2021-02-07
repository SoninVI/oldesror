// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require popper
//= require turbolinks
//= require activestorage
//= require bootstrap-slider
//= require article
//= require libs.min
//= require scripts.min




document.addEventListener("turbolinks:load", () => {



    console.debug("turbolinks:load");

    $(function() {
        $('.carouselExampleFade').slider();
        $('.carousel-item:first').addClass('active')
    });




});

    var Article = {
    searchQuery: {},
    $articlesList: undefined,
    onload: document.addEventListener('DOMContentLoaded', function () { Article.init(); }),
    init: function () {
    this.$articlesList = $('div#articles-list');
    $(document).on('click', 'a.fetch-articles', function(e) {
    e.preventDefault();
    Article.searchQuery.currentPage++;
    Article.ajax.fetchArticles(() => {
    if (parseInt(Article.searchQuery.currentPage) === Article.searchQuery.totalPages) {
    $(this).fadeOut('fast', () => { $(this).remove(); });
}
});
});
},
    ajax: {
    obj: {}, url: undefined, send: function(success, failure) {
    $.post(AJAX_URL, this.obj, function(answer) {
    Article.ajax.obj = {};
    answer.result && typeof success === 'function' ? success(answer) :
    !answer.result && typeof failure === 'function' ? failure(answer) : null;
}, 'JSON');
},
    fetchArticles: function(callback) {
    this.obj.method = 'fetchArticles';
    this.obj.searchQuery = Article.searchQuery;
    this.send(function(answer) {
    Article.$articlesList.append(answer.html);
    Article.searchQuery = answer.searchQuery;
    typeof callback === 'function' ? callback() : null;
});
}
}
};
