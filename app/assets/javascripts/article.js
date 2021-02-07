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
