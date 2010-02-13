#
#  controller.rb
#  missing_album_notifier
#
#  Created by Gerard de Brieder on 2/13/10.
#  Copyright (c) 2010 Govannon. All rights reserved.
#

class Album
  attr_accessor :name
end

class Controller
	attr_writer :albumsTableView
	attr_writer :coverImage
	attr_writer :artistName

	def awakeFromNib
	  @artistName.setObjectValue("Opeth")
	  @coverImage.image= NSImage.alloc.initByReferencingURL NSURL.URLWithString("http://api.ning.com/files/dNL4njLhoWiwQLpq1fvYsRfthL*4QvQQ6BHey-fKlgMdmXHKqiOhnJrcOnYdRSih1UbalsuGq*5fYbB-RJnlC9g4oD9H1Z7P/opeth_gr_1024722049.jpg")
		@albums = []
		populate_albums
		@albumsTableView.dataSource = self
	end

	def numberOfRowsInTableView(view)
		@albums.size
	end

	def tableView(view, objectValueForTableColumn:column, row:index)
		album = @albums[index]
		case column.identifier
			when 'name'
				album.name
		end
	end

	def populate_albums
	  ["Damnation", "Morningrise", "Demon of the Fall"].each do |a|
  		new_album=Album.new
  		new_album.name=a
  		@albums<<new_album
    end
	end
end



