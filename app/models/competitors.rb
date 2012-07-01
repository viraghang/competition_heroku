require 'file_size_validator'

class Competitors < ActiveRecord::Base
	
	mount_uploader :image, AvatarUploader

	validates :image, :file_size => {:maximum => 0.5.megabytes.to_i}

	email_format = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	validates_presence_of :name, :message => "Nem maradhat üresen!"
	validates_presence_of :email, :message => "Nem maradhat üresen!"
	validates_presence_of :tender_name, :message => "Nem maradhat üresen!"
	validates_presence_of :telephone, :message => "Nem maradhat üresen!"
	validates_presence_of :zipcode, :message => "Nem maradhat üresen!"
	validates_presence_of :address, :message => "Nem maradhat üresen!"
	validates_presence_of :comments, :message => "Nem maradhat üresen!"
	validates_presence_of :image, :message => "Kérem, töltsön fel képet!"
	validates_length_of :name, :minimum => 10, :too_short => "Túl kevés karakter!"
	validates_length_of :tender_name, :minimum => 10, :too_short => "Túl kevés karakter!"
	validates_length_of :address, :minimum => 10, :too_short => "Túl kevés karakter!"
	validates_length_of :telephone, :minimum => 9, :message => "Minimum 9 karakter szükséges!"
	validates_length_of :zipcode, :is => 4, :message => "4 szám szükséges!", :wrong_length => "4 szám szükséges!"
	validates_numericality_of :zipcode, :only_integer => true, :message => "Csak számok!"
	validates_uniqueness_of :name, :message => "Ezt a nevet már használták!"
	validates_uniqueness_of :email, :message => "Ezt az e-mail címet már használták!"
	validates_presence_of :terms, :message => "Kérem, fogadja el a szabályzatot!"
	validates_format_of :email, :with => email_format, :message => "Helytelen formátum!"
end
