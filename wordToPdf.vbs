On Error Resume Next
Dim docPath, pdfPath, doc2Pdf, objDoc, wdFormatPdf, state

' *********************************** '
' wordתpdf
' ���ñ���word����Ϊpdf�Ĺ�����ʵ��
'
' ״̬��˵��:
' 1 û��word
' 2 û��wordתpdf
' 3 ��wordʧ��
' 0 �ɹ�
' *********************************** '

pdfPath = "E:\\�½�����doc.pdf"
docPath = "E:\\test.docx"
wdFormatPdf = 17

err.clear
Set doc2Pdf = CreateObject("Word.Application")

If err.number <> 0 Then
  state = 1
Else
  err.clear
  Set objDoc = doc2Pdf.Documents.Open(docPath)
  If err.number <> 0 Then
    state = 3
  Else
    err.clear
    objDoc.SaveAs pdfPath, wdFormatPdf
    objDoc.Close()
    doc2Pdf.Quit
    If err.number <> 0 Then
      state = 2
    Else
      state = 0
    End If
  End If
End IF

msgBox(state)
  