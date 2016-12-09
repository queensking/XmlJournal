using Saxon.Api;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace XJ.Web.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }

        public void TestSaxonFromFileToStream()//string sourceUri, string xsltUri)
        {
            //SaxonController saxon = new SaxonController();

            //saxon.XmlToStream(@"D:\test.xml", @"D:\test.xsl");
            //return View();
            string sourceUri = @"D:\test.xml";
            string xsltUri = @"D:\test.xsl";
            //Processor属于Saxon.Api
            Processor processor = new Processor();

            //加载源文档
            XdmNode input = processor.NewDocumentBuilder().Build(new Uri(sourceUri));
            //为StyleSheet创建一个新的转换器
            XsltTransformer transformer = processor.NewXsltCompiler().Compile(new Uri(xsltUri)).Load();

            transformer.InitialContextNode = input;

            transformer.BaseOutputUri = new Uri(xsltUri);

            // transformer.SetParameter(new QName("", "", "a-param"), new XdmAtomicValue("hello to you!"));
            // transformer.SetParameter(new QName("", "", "b-param"), new XdmAtomicValue(someVariable));

            // Create a serializer.
            Serializer serializer = new Serializer();
            serializer.SetOutputWriter(Response.Output); //for screen



            // serializer.SetOutputFile(Server.MapPath("test.html")); //for file

            // Transform the source XML to System.out.
            transformer.Run(serializer);
        
        }

        public void TestSaxonFromFileToFile()//string sourceUri, string xsltUri)
        {
            //SaxonController saxon = new SaxonController();

            //saxon.XmlToStream(@"D:\test.xml", @"D:\test.xsl");
            //return View();
            string sourceUri = @"D:\test.xml";
            string xsltUri = @"D:\test.xsl";
            //Processor属于Saxon.Api
            Processor processor = new Processor();

            // Load the source document.
            XdmNode input = processor.NewDocumentBuilder().Build(new Uri(sourceUri));

            // Create a transformer for the stylesheet.
            XsltTransformer transformer = processor.NewXsltCompiler().Compile(new Uri(xsltUri)).Load();

            // Set the root node of the source document to be the initial context node.
            transformer.InitialContextNode = input;

            // BaseOutputUri is only necessary for xsl:result-document.
            transformer.BaseOutputUri = new Uri(xsltUri);

            // transformer.SetParameter(new QName("", "", "a-param"), new XdmAtomicValue("hello to you!"));
            // transformer.SetParameter(new QName("", "", "b-param"), new XdmAtomicValue(someVariable));

            // Create a serializer.
            Serializer serializer = new Serializer();
            //serializer.SetOutputWriter(Response.Output);
            //serializer.SetOutputFile(Server.MapPath(@"D:\test.html"));
            serializer.SetOutputFile(@"D:\test.html");

            // Transform the source XML to System.out.
            transformer.Run(serializer);


        }

        public void TestSaxonFromFileToFileWithParameters()//string sourceUri, string xsltUri)
        {
            //SaxonController saxon = new SaxonController();

            //saxon.XmlToStream(@"D:\test.xml", @"D:\test.xsl");
            //return View();
            string sourceUri = @"D:\test.xml";
            string xsltUri = @"D:\test.xsl";
            //Processor属于Saxon.Api
            Processor processor = new Processor();

            // Load the source document.
            XdmNode input = processor.NewDocumentBuilder().Build(new Uri(sourceUri));

            // Create a transformer for the stylesheet.
            XsltTransformer transformer = processor.NewXsltCompiler().Compile(new Uri(xsltUri)).Load();

            // Set the root node of the source document to be the initial context node.
            transformer.InitialContextNode = input;

            transformer.SetParameter(new QName("", "", "maxmin"), new XdmAtomicValue("yes"));
            transformer.SetParameter(new QName("", "", "pricestock"), new XdmAtomicValue("price"));

            // BaseOutputUri is only necessary for xsl:result-document.
            transformer.BaseOutputUri = new Uri(xsltUri);

           

            // Create a serializer. 
            Serializer serializer = new Serializer();
            //TextWriter tw = new StreamWriter();
            serializer.SetOutputWriter(Response.Output);
            //serializer.SetOutputFile(Server.MapPath(@"D:\test.html"));
            //serializer.SetOutputFile(@"D:\test.html");



            // Transform the source XML to System.out.
            transformer.Run(serializer);


        }
    }
}
