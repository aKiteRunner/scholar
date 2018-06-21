package com.web.test;

import org.elasticsearch.common.text.Text;
import com.web.bean.PaperForSearch;
import com.web.bean.User;
import com.web.dao.UserMapper;
import com.web.service.PaperService;
import com.web.service.UserService;
import org.apache.ibatis.session.SqlSession;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.deletebyquery.DeleteByQueryAction;
import org.elasticsearch.action.deletebyquery.DeleteByQueryRequestBuilder;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.plugin.deletebyquery.DeleteByQueryPlugin;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.highlight.HighlightBuilder;
import org.elasticsearch.search.highlight.HighlightField;
import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.fasterxml.jackson.databind.ObjectMapper;
import javax.swing.*;
import javax.swing.text.Highlighter;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import static org.elasticsearch.index.query.QueryBuilders.multiMatchQuery;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Test {
    public static void main(String[] args) {
        double a = 1.2;
        System.out.println((int)a);
    }
//    @Autowired
//    UserMapper userMapper;
//
//    @Autowired
//    SqlSession sqlSession;
//    @Autowired
//    private PaperService paperService;
//
//
//    private static final String HOST = "127.0.0.1";
//    private static final int PORT = 9300;
//
//    private static final ObjectMapper MAPPER = new ObjectMapper();
//    private TransportClient client = null;
//
//    @org.junit.Test
//    public void test(){
//
//        List<PaperForSearch> list = paperService.selectPaperForSearch();
//        for(PaperForSearch pfs : list){
//            System.out.println(pfs.getId() + pfs.getName());
//        }
//    }

//    @org.junit.Test
//    public void createDocumentByJson() throws Exception{
//        List<PaperForSearch> plist = paperService.selectPaperForSearch();
//        for(PaperForSearch pfs : plist) {
//            System.out.println(pfs.getId() + pfs.getName());
//
//            Map<String, Object> source = new HashMap<String, Object>();
//            source.put("id", pfs.getId());
//            source.put("name", pfs.getName());
//            source.put("popularity", pfs.getPopularity());
//            source.put("abstract1", pfs.getAbstract1());
//            source.put("scholarName", pfs.getScholarname());
////            System.out.println(pfs.getTime().toString());
////            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
////            String str = sdf.format(pfs.getTime());
////            System.out.println(str);
////            source.put("time", str);
//            // 也可以转化java的bean
//            String json = MAPPER.writeValueAsString(source);
//            IndexResponse response = this.client.prepareIndex("pfs", "PaperForSearch")
//                    .setSource(json)
//                    .execute()
//                    .actionGet();
//        }

        // 获取结果
//        String index = response.getIndex();
//        String type = response.getType();
//        String id = response.getId();
//        long version = response.getVersion();
//        boolean created = response.isCreated();

//        System.out.println("索引是: " + index);
//        System.out.println("类型是: " + type);
//        System.out.println("文档id是: " + id);
//        System.out.println("版本是: " + version);
//        System.out.println("是否创建: " + created);
//    }

//    @org.junit.Test
//    public void testQuery() {
//        SearchRequestBuilder searchRequestBuilder = this.client.prepareSearch("pfs").setTypes("PaperForSearch")
//                .setQuery(multiMatchQuery("华为","name", "abstract1", "scholarName"));
//
//        searchRequestBuilder.addHighlightedField("abstract1").addHighlightedField("name").addHighlightedField("scholarName");
//        searchRequestBuilder.setHighlighterPreTags("<em>");
//        searchRequestBuilder.setHighlighterPostTags("</em>");
//        // 设置摘要大小
//        searchRequestBuilder.setHighlighterFragmentSize(10);
//        SearchResponse response = searchRequestBuilder.get();
//        // 查询的总数(命中数)
//        SearchHits hits = response.getHits();
//        long totalHits = hits.getTotalHits();
//        System.out.println("总记录数: " + totalHits);
//        // 遍历查询的结果
//        Iterator<SearchHit> iterator = hits.iterator();
//        while (iterator.hasNext()) {
//            SearchHit next = iterator.next();
//            // System.out.println(next.getSourceAsString());
//
//            Map<String, Object> source = next.getSource();
//            Map<String, HighlightField> highlighterMap = next.getHighlightFields();
//
//            Integer id = (Integer) source.get("id");
//            Double popularity = (Double) source.get("popularity");
//
//            HighlightField highlightField;
//            Text[] texts;
//            String name = "";
//            String abstract1 = "";
//            String scholarName = "";
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
//            String time= sdf.format(paperService.selectById(id).getTime());
//
//            if(highlighterMap.get("name") != null) {
//                highlightField = highlighterMap.get("name");
//                texts = highlightField.getFragments();
//                for (Text text : texts) {
//                    name += text;
//                }
//            }else{
//                name = (String)source.get("name");
//            }
//
//            if(highlighterMap.get("abstract1") != null) {
//                highlightField = highlighterMap.get("abstract1");
//                texts = highlightField.getFragments();
//                for (Text text : texts) {
//                    abstract1 += text;
//                }
//            } else{
//                abstract1= (String)source.get("abstract");
//            }
//
//            if(highlighterMap.get("scholarName") != null) {
//                highlightField = highlighterMap.get("scholarName");
//                texts = highlightField.getFragments();
//                for (Text text : texts) {
//                    scholarName += text;
//                }
//            }else{
//                scholarName = (String)source.get("scholarName");
//            }
//
//            System.out.println("id: " + id);
//            System.out.println("name: " + name);
//            System.out.println("popularity: " + popularity);
//            System.out.println("abstract: " + abstract1);
//            System.out.println("scholarName: " + scholarName);
//            System.out.println("time: " + time);
//        }
//    }



//    @org.junit.Test
//    public void deleteDocument(){
//        StringBuilder b = new StringBuilder();
//        b.append("{\"query\":{\"match_all\":{}}}");
//        DeleteByQueryRequestBuilder response = new DeleteByQueryRequestBuilder(client, DeleteByQueryAction.INSTANCE);
//        response.setIndices("pfs").setTypes("PaperForSearch").setSource(b.toString())
//                .execute()
//                .actionGet();
//
//
//    }
//
//
//    // 获取客户端
//    @Before
//    public void getClient() throws Exception{
//        client = TransportClient.builder()
//                .addPlugin(DeleteByQueryPlugin.class)
//                .build()
//                .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(HOST), PORT));
//    }

    // 关闭客户端
//    @After
//    public void closeClient(){
//        if (this.client != null){
//            this.client.close();
//        }
//    }
}
