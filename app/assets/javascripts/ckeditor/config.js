

CKEDITOR.editorConfig = function( config ) {
    config.indentClasses = ["ul-grey", "ul-red", "text-red", "ul-content-red", "circle", "style-none", "decimal", "paragraph-portfolio-top", "ul-portfolio-top", "url-portfolio-top", "text-grey"];
    config.protectedSource.push(/<(style)[^>]*>.*<\/style>/ig);
    config.protectedSource.push(/<(script)[^>]*>.*<\/script>/ig);// разрешить теги <script>
    config.protectedSource.push(/<(i)[^>]*>.*<\/i>/ig);// разрешить теги <i>
    config.protectedSource.push(/<\?[\s\S]*?\?>/g);// разрешить php-код
    config.protectedSource.push(/<!--dev-->[\s\S]*<!--\/dev-->/g);
    config.allowedContent = true; /* all tags */
    config.toolbar_Custom = [
        { name: 'document',    items : [ 'Source','-','Save','NewPage','DocProps','Preview','-','Templates' ] },
        { name: 'clipboard',   items : [ 'PasteFromWord','-','Undo','Redo' ] },
        { name: 'insert',      items : [ 'Image','Table','HorizontalRule','SpecialChar','PageBreak' ] },
        { name: 'tools',       items : [ 'Maximize', 'ShowBlocks','-','About' ] },
        '/',
        { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
        { name: 'paragraph',   items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
        { name: 'links',       items : [ 'Link','Unlink','Anchor' ] },
        '/',
        { name: 'styles',      items : [ 'Styles','Format','Font','FontSize' ] },
        { name: 'colors',      items : [ 'TextColor','BGColor' ] }
    ];

    config.toolbar = 'Custom';
};