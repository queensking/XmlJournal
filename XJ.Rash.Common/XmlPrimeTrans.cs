using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using XmlPrime;

namespace XJ.Rash.Common
{
    public class XmlPrimeTrans
    {
        private static void PerformTransformation(string inputPath, string xsltPath, string outputPath)
        {
            Debug.Assert(inputPath != null, "inputPath in null");
            Debug.Assert(xsltPath != null, "xsltPath in null");
            Debug.Assert(inputPath != null, "outputPath in null");

            // First, we create a new XmlNameTable instance. This will be used to share information such 
            // as element and attribute names between the XML documents and the transformation.
            var nameTable = new NameTable();

            // Next we create an XmlReaderSettings instance and set its NameTable property. 
            // In order for XmlPrime to work correctly all documents passed in to Xslt must be loaded
            // with the XmlNameTable used to compile the query. 
            var xmlReaderSettings = new XmlReaderSettings { NameTable = nameTable };

            // In order to transform  the document we load it into an XdmDocument.
            XdmDocument document;
            using (var reader = XmlReader.Create(inputPath, xmlReaderSettings))
            {
                document = new XdmDocument(reader);
            }

            


            // In order to describe how the transformation should be compiled we need set up an XsltSettings 
            // object.  This describes all the settings used for compilation.
            // In particular, we will set the name table used by the transformation to match the one we used 
            // earlier and we will set the context item type. 
            // By default the context item type is set to none, and so the context item cannot be set unless 
            // we override the type here. 
            var xsltSettings = new XsltSettings(nameTable) { ContextItemType = XdmType.Node, };

            // We can then compile the transformation using the Compile method. 
            // This returns us an Xslt object encapsulating the transformation. 
            var xslt = Xslt.Compile(xsltPath, xsltSettings);
            

            // Now we have our transformation object we now just need to execute it. 
            // We use a DynamicContextSettings object which describes the parameters used to evaluate the query. 
            // In particular we will set the context item to be the document that we loaded earlier. 
            var contextItem = document.CreateNavigator();

            //ParameterDictionary parameters=new ParameterDictionary();
            //parameters.Add(new XmlQualifiedName("titleStyleId"),2);

            var settings = new DynamicContextSettings { ContextItem = contextItem};
            settings.Parameters.Add(new XmlQualifiedName("titleStyleId"), 2);

            // We will use the ApplyTemplates method to initiate a transformation by applying templates 
            // in the default mode and serializing the primary result document to a stream.
            using (var outputStream = File.Create(outputPath))
            {
                xslt.ApplyTemplates(settings, outputStream);
            }

        }
    }
}
