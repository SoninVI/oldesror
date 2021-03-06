class Post < ApplicationRecord

  has_attached_file :image,
                    styles: {
                      thumb: '100x100>',
                      small: '150x150>',
                      medium: '200x200>',
                      xl: '800x400>'}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
