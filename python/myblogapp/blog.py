
import cgi
import datetime
import webapp2

from google.appengine.ext import db

class Blog(db.Model):
  author = db.StringProperty()
  content = db.StringProperty(multiline=True)
  date = db.DateTimeProperty(auto_now_add=True)


class MainPage(webapp2.RequestHandler):
  def get(self):
    self.response.out.write('<html><body>')

    posts = db.GqlQuery("SELECT * "
                            "FROM Blog "
                            "ORDER BY date DESC LIMIT 5")

    for post in posts:
      
      self.response.out.write('%s' % post.author)
      self.response.out.write('wrote')
      self.response.out.write('<blockquote>%s</blockquote>' %
                              cgi.escape(post.content))


    self.response.out.write("""
          <form action="/comment" method="post">
	    <div>Name  :<input type="text" name="author"></div>
            <div><textarea name="content" rows="3" cols="60"></textarea></div>
            <div><input type="submit" value="Comment"></div>
          </form>
        </body>
      </html>""")


class Comment(webapp2.RequestHandler):
  def post(self):
    blog = Blog()
    blog.author=self.request.get('author')
    blog.content = self.request.get('content')
    blog.put()
    self.redirect('/')


app = webapp2.WSGIApplication([
  ('/', MainPage),
  ('/comment', Comment)
], debug=True)
