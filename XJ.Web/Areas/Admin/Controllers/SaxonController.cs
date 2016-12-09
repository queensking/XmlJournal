using Saxon.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace XJ.Web.Areas.Admin.Controllers
{
    public class SaxonController : Controller
    {
        public void XmlToStream(string sourceUri, string xsltUri)
        {
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
    }
}
