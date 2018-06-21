package com.web.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.bean.PaperForSearch;
import com.web.service.PaperService;
import org.elasticsearch.action.deletebyquery.DeleteByQueryAction;
import org.elasticsearch.action.deletebyquery.DeleteByQueryRequestBuilder;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.plugin.deletebyquery.DeleteByQueryPlugin;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.highlight.HighlightField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.elasticsearch.index.query.QueryBuilders.multiMatchQuery;

@Controller
public class SearchController {
    private final PaperService paperService;
    private static final String HOST = "127.0.0.1";
    private static final int PORT = 9300;

    private static final ObjectMapper MAPPER = new ObjectMapper();
    private TransportClient client = null;

    @Autowired
    public SearchController(PaperService paperService){
        this.paperService = paperService;
    }


    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(@RequestParam(value = "query") String query, Model model) throws Exception{
        List<HashMap<String, Object>> list = new ArrayList<>();
        getClient();
//        deleteDocument();
//        createDocumentByJson();
//        wait(100);
        list = queryDocument(query);
        closeClient();
        model.addAttribute("list", list);
        return "search";
    }

    public void getClient() throws Exception{
        client = TransportClient.builder()
                .addPlugin(DeleteByQueryPlugin.class)
                .build()
                .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(HOST), PORT));
    }

    public void closeClient(){
        if (this.client != null){
            this.client.close();
        }
    }

    public void createDocumentByJson() throws Exception{
        List<PaperForSearch> plist = paperService.selectPaperForSearch();
        for(PaperForSearch pfs : plist) {
            System.out.println(pfs.getId() + pfs.getName());

            Map<String, Object> source = new HashMap<String, Object>();
            source.put("id", pfs.getId());
            source.put("name", pfs.getName());
            source.put("popularity", pfs.getPopularity());
            source.put("abstract1", pfs.getAbstract1());
            source.put("scholarName", pfs.getScholarname());

            // 也可以转化java的bean
            String json = MAPPER.writeValueAsString(source);
            IndexResponse response = this.client.prepareIndex("pfs", "PaperForSearch")
                    .setSource(json)
                    .execute()
                    .actionGet();
        }
    }

    public void deleteDocument(){
        StringBuilder b = new StringBuilder();
        b.append("{\"query\":{\"match_all\":{}}}");
        DeleteByQueryRequestBuilder response = new DeleteByQueryRequestBuilder(client, DeleteByQueryAction.INSTANCE);
        response.setIndices("pfs").setTypes("PaperForSearch").setSource(b.toString())
                .execute()
                .actionGet();
    }

    List<HashMap<String, Object>> queryDocument(String query) {
        List<HashMap<String, Object>> list = new ArrayList<>();
        SearchRequestBuilder searchRequestBuilder = this.client.prepareSearch("pfs").setTypes("PaperForSearch")
                .setQuery(QueryBuilders.multiMatchQuery(query,"name", "abstract1", "scholarName"));

        searchRequestBuilder.addHighlightedField("abstract1").addHighlightedField("name").addHighlightedField("scholarName");
        searchRequestBuilder.setHighlighterPreTags("<font color=\"red\">");
        searchRequestBuilder.setHighlighterPostTags("</font>");
        // 设置摘要大小
        searchRequestBuilder.setHighlighterFragmentSize(10);
        SearchResponse response = searchRequestBuilder.execute().actionGet();
        // 查询的总数(命中数)
        SearchHits hits = response.getHits();
        long totalHits = hits.getTotalHits();
        System.out.println("总记录数: " + totalHits);
        // 遍历查询的结果
        Iterator<SearchHit> iterator = hits.iterator();
        while (iterator.hasNext()) {
            SearchHit next = iterator.next();
            // System.out.println(next.getSourceAsString());

            Map<String, Object> source = next.getSource();
            Map<String, HighlightField> highlighterMap = next.getHighlightFields();

            Integer id = (Integer) source.get("id");
            Double popularity = (Double) source.get("popularity");

            HighlightField highlightField;
            Text[] texts;
            String name = "";
            String abstract1 = "";
            String scholarName = "";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
            String time= sdf.format(paperService.selectById(id).getTime());

            if(highlighterMap.get("name") != null) {
                highlightField = highlighterMap.get("name");
                texts = highlightField.getFragments();
                for (Text text : texts) {
                    name += text;
                }
            }else{
                name = (String)source.get("name");
            }

            if(highlighterMap.get("abstract1") != null) {
                highlightField = highlighterMap.get("abstract1");
                texts = highlightField.getFragments();
                for (Text text : texts) {
                    abstract1 += text;
                }
            } else{
                abstract1= (String)source.get("abstract1");
            }

            if(highlighterMap.get("scholarName") != null) {
                highlightField = highlighterMap.get("scholarName");
                texts = highlightField.getFragments();
                for (Text text : texts) {
                    scholarName += text;
                }
            }else{
                scholarName = (String)source.get("scholarName");
            }

            System.out.println("id: " + id);
            System.out.println("name: " + name);
            System.out.println("popularity: " + popularity);
            System.out.println("abstract1: " + abstract1);
            System.out.println("scholarName: " + scholarName);
            System.out.println("time: " + time);

            HashMap<String, Object> map = new HashMap<>();
            map.put("id", id);
            map.put("name", name);
            map.put("popularity", popularity);
            map.put("abstract1", abstract1);
            map.put("scholarName", scholarName);
            map.put("time", time);
            list.add(map);
        }
        return list;
    }
}
